### Ticketmaster System Design
Ticketmaster is an online platform that allows users to purchase tickets for concerts,
sports events, theater, and other live entertainment. Has ~100M DAU

## Functional requirements
- book tickets
- view an event
- search for events

## Non-functional requirements
- low latency search
- strong consistency for booking tickets (no double booking)
- high availability for search and viewing events
- read >> write
- scalability to handle surges from popular events

---------------
Out of scope:
- SDPR compliance
- fault tolerance
- etc.

## Core entities: (I don't know the data yet so this is general)
- Event
- Venue
- Performer
- Ticket

## API
- GET /event/:eventID -> event and venue and performer and ticket[]
- GET /search?term={term}&location={location}&type={type}&date={date}... -> partial<Event>[] (search results list)
- POST /booking/reserve
    header: JWT | sessionToken (user info)
    body: { ticketID }

  POST /booking/confirm
    header: JET | sessionToken
    body: { ticketID, paymentDetails(e.g. stripe) }


## High level design

                - auth                                                              
                - rate limiting
                - routing to service                                         POSTGRES DB (allows for transactions and relationships)
Client  --------> API Gateway  ----------> Event CRUD Service   <-----------> Database  
        CDN                                                                    Event:
        - can cache                                                           -ID, venueID, performerID, tickets[keys],
                                                                              name, description ...
                                                                              Venue:
                                                                              - ID, location, seatMap
                                                                              Performer:
                                                                              - ID,...
                                                                              Ticket:
                                                                              -ID, eventID, seat, price


                                                                              
                  API Gateway  ----------> Search service    <-----------------> POSTGRES DB  (we can use SQL queries, but will be super slow to match terms)

                              
                                                                                 (Distributed lock)
                              reserve(ticketID)               -----------------> Ticket Lock (redis) IN MEMORY CACHE
                              confirm(ticketID)                                   - {ticketID: true} TTL 10
                              payment(ticketID)                                                     
                  API Gateway  ------------> Booking Service  ------------------> POSTGRES DB         
                                                                                  Ticket:                                  
                                                                                  -ID, eventID, seat, price
                                                                                  Status: (available, booked), 
                                                                                  userID (when booked)

                                          Booking service <---------> Stripe (for payment information)

                  API GATEWAY ----> virtual waiting queue ----> booking service


## Deep dive

- how to fix low latency search?
                                                             (AWS opensearch) -> node query caching (caches top 10K searches)
API Gateway -------------> Search service ------------------> Elasticsearch
                                                              - invertedIndex on text
                                                              - tokenized the text
                                                              - map events to tokenized text

                                                              - not good as primary DB
                                                              - no durability

                    Event CRUD service ---------------------> Elasticsearch

- how to have strong booking consistency?
  ---> Cient will have a long polling
  ---> Websockets?
  ---> Server sent events (persistent connection from the server)
        - have a connection from client to server and it will check the ticket lock and ticket status
