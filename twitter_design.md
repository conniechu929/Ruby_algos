### Twitter System design

## Functional requirements
- create an account and login
- create, edit, and delete tweets
- follow other users
- view a timeline of tweets from following
- like, reply and retweet
- search for tweets

## Non-functional requirements
- scale to 100+ millions of users
- handle a high volume of tweets, likes, and retweets
- highly available (99.999% uptime)
- security and privacy of user data
- low latency (users should not have a long time to wait for tweets)

## High level design
                                                           - forward request to
          HTTPS                                              service
client  <----------> load balancer <----------------------> API Gateway       
                - routing algorithm
                  (round robin, 
                  least connection,
                  IP hash)
                - layer:
                  -> layer 4: transport layer (TCP)
                  -> layer 7: application layer(HTTPS)
          
              write (Rate Limiter)
API GATEWAY --------------> tweet CRUD service   -----------------> MongoDB (tweet content)  ---------> S3: Blob storage (media)
                    (FUNCTIONAL: create, edit,                      - Key/Value pairs to store data   
                    delete, store metadata)                             
                    (NON FUNCTIONAL: 
                    high throughput) --> ESPECIALLY READS
                                                  ----------------> S3: Blob storage (media)  --------> CDN (to serve the media content)
                                                                     - quick to retrieve
              reads
            ----------------> tweet CRUD service
            HAVE A REDIS CACHE
            
CLIENT <------------------------------------------------------------------------------------------- CDN


                                Tweet CRUD srv   --------------> Replies DB (indexed by tweet ID for fast lookup)

              write (Rate limiter)
API GATEWAY --------------> Reply CRUD service  -----------> Replies DB (Key/value pairs to store data)
                                                          - for scalability and
                                                          performance



API GATEWAY --------------> Search service   --------------> Elasticsearch (reverse index on: tweet content, username, hashtags)
                                                            - fast data text search 
                                          
                                          
                                            Change Data Capture[CDC] (when tweets are updated,
                                            this gets propagated to elasticsearch)
                            Tweet Context DB -----------------------> Elasticsearch                  

                                                                                       - Fanout-on-read (for mega users with lots of followers)      
API GATEWAY --------------> Timeline service  ------------- Tweet context DB ----------------------------> Timeline cache

                            Tweet CRUD srv -----> Message Queue   ----> Timeline Fanout -------> Timeline cache
                                        -when friends create        - fanout-on-write
                                        a tweet


API GATEWAY --------------> Profile service  --------> Mysql (user data)
                                             --------> Following Data

                                            <---------> Auth And IAM


## Security
- Authentication and Authorization: make sure requests from legitimate user and w/legitmate permissions
- Encryption: Data encryption
- Rate limiting: For DDos attacks (requests from overwhelming system)
- Input validation: on client and server

## Monitoring
1. health checks
  - prometheus and graphana
2. Logging
  - user logs
  - Splunk
3. Alerts
  - failed log ins
  - services are down
4. Testing
  - load testing
  - automated testing
    --> continuous testing
    --> integration testing
  - Backup and recovery


