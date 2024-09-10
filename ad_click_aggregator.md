### Ad Click Aggregator
- This is an infrastructure design question
- Primary goal: Satisfy non-functional requirements -> requirements, system interface and data flow, high level design, deep dives
- Primary goal: satisfy functional requirements -> requirements, system interface and data flow, high level design

## Functional requirements (features of the system, what user expects from the system)
- users click an ad and get redirected to the advertiser's website
- Advertisers can query click metrics over time w/ 1 minute min granularity 

-- out of scope --
- ad targeting and serving
- cross device tracking
- integration with offline channels

How many ads do you support?
- 10M ads at any given time
- 10k ad clicks per second at peak

## Non-functional requirements
- scalable to support peak 10k CPS
- low latency analytics queries < 1s (what is the low latency? for what are we quantifying the low latency?)
- fault tolerance 
- data integrity
- as real time as possible
- idempotency of ad clicks

-- out of scope --
- spam detection
- demographic profiling
- conversion tracking

## System interface and data flow
- Input:
  - click data
  - advertiser queries

- Outputs:
  - redirection
  - aggregated click metrics

- Data flow:
1. click data comes into the system
2. user is redirected
3. click data validated
4. click data logged
5. click data aggregated
6. aggregated data queried

## High level design


        ------------> ad placement service      ------> ad DB (ads: adID, redirectUrl, metadata)
Browser ------------> click processor service   ------> get redirectUrl (adID) for Ad DB
        302 redirect        --------------------------> click DB (click events: eventID, userID, timestamp) 



advertiser                              -adID, minute, total clicks
browser       -----> query service --------------> OLAP  <-------------- spark  -------> Click DB
                                          -optimized for read         chron scheduler 
                                                                        (every 5 min)


## Deep dives

- REMOVE SPARK BECAUSE OF THE LIMIT OF 5 min
                                                                    (stream processor)
click processor service -------> Kinesis (event stream) ----------> Flink (keeps in memory. AdID: 1, minute: 45, count: 12)
                                 -real time data                      [aggreated data]
                                                                      Aggregation window: 1 min
                                                                      flush intervals: 10 second (intermediary data flush)

FLINK --------> OLAP --------------> query service  ---------> advertiser browser
                                                          
- how can we scale?
  - scale click processor service dynamically (horizontal scaling)
  - have a redis cache for the click processor service (HOW TO SPOT BOTS OR IDEMPOTENCY AD CLICKS)
      -> verify signature
      -> check if ad impression id already exists in cache, if so drop it, IT'S A DUPLICATE
  - load balancer (AWS managed API Gateway) before the ad placement and click processor service
  - Kinesis: limit 1000 record/s
      - shard by adID
      - HOT SHARDS:
      - you have a hot shard with a particular ad, too many writes
          -> add to the shard key (primary key)
          -> shard on adID : 0-N (up to N partitioned shard)
          -> before writing to kinesis
      - ENABLE kinesis to dump S3 data store (periodic reconcilation)

                                                                    (day interval)
        KINESIS ----------> S3 <-------------- spark (map reduce) <------- chron scheduler
                                                                  --------> reconciliation worker ---------> OLAP
                                                                            - potentially fixing 
                                                                            incorrect records



  - multiple Flinks because we shard by adID
    -> have a single Flink job in charge of it's own adID
    -> no point to use check point because of the small aggregation window(1min-5min)

  - OLAP: how to scale?
      - shard by AdvertiserID
  - Can always assume the event stream is always up (like Kafka and kinesis)
      -> we can configure to keep event data
      -> enable 7 day retention policy