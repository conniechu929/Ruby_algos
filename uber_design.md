### Uber System Design
Uber is a ride-sharing platforms that connect passengers with drivers who offer transportation
services in personal vehicles. It allows users to book rides on-demand from their smartphones, matching
them with a nearby driver who will take them from their location to their desired destination.

## Functional requirements
1. Users should be able to input a start location and a destination and get an estimate fare
2. user should be able to request a ride based on an estimate
3. Drivers should be able to accept/deny a request and navigate to pickup/dropoff


-------- out of scope --------
- multiple car types
- ratings for drivers and riders
- schedule a ride in advance

## Non-functional requirements
1. low latency matching <1 min to match or failure
2. consistency of matching. Ride to driver is 1:1
3. highly availably outside the matching
4. handle high throughput, surges for peak hours or special events. 100s of thousands of requests
within given region

------ out of scope ---------
- GPDR user privacy
- resilience and handling system failures
- monitoring, logging, alerting, etc
- CI/CD pipeline

**INSTEAD OF BACK OF ENVELOPE CALULATIONS:
- I know a lot of candidates do back on the envelope calculations now, but it's my preference to forgo them for now
and that instead I'll do estimations during my high level design if there are some calculations I have to do
that will directly impact my design.

## Core entitiies
- Ride
- Driver
- Rider
- Location

## API
The requests will have a JWT / sessionToken header

- POST /ride/fare-estimate --> Partial<Ride>
  { 
    source,
    destination
  }

- PATCH /ride/request --> 200 (this call happen async)
  {
    rideID
  }

- POST /location/update
  {
    lat,
    long
  }

- PATCH /ride/driver/accept
  {
    rideID,
    true/false
  }

- PATCH /ride/driver/update --> lat/long | null
  {
    rideID,
    status: 'pickedup', 'dropoff'
  }

## High Level design

                      AWS managed       getFareEstimate()
Rider     -----------> API GATEWAY   <--------------------->  Ride Service      <--------------> 3rd Party mapping 
(iOS/android)       - load balancing      accept(bool)     - handles fare estimation           - get fare estimate
                    - routing             update()
                    - authentication
                    - SSL termination
                    - rate limiting
                                                                                        (Could be DynamoDB, sets TTL)
                                                            Ride Service   <-----------> Primary DB 
                                                                                        Rider:
                                                                                        -ID, RiderID, Fare, ETA, Source, Destination, Status: Fare-estimated...

                                                                                        Ride:
                                                                                        - ID, ...metadata

                                                                                        Driver:
                                                                                        - ID, ...metadata, status: in ride offline, available
                                            getStatus(driverID)
                              Ride Service <-------------------> Ride Matching Service
                      
                      requestRide()  
                      <--------> Ride Request Queue <----> Ride matching service
                                - partition by regions

                        requestRide()                               getDriverLocations()
          API GATEWAY <--------------------> Ride Matching Service  <----------------->   Location DB
                                            -matches drivers and                         - Store the location of drivers
                                              riders

                        updateLocation()
          API GATEWAY <--------------------> Location Service     <----------------> Location DB

          (Horizontally scaled)
          Ride Matching Service -----------------> Notification Service (APN, Firebase) -----------> Driver

          Ride Matching service <---------> REDIS (DISTRIBUTED LOCK!!)
                                            - set driverID TRUE
                                            EXPIRE 5s

                                                                                      
## Deep Dive

Driver <---------------> API GATEWAY <---------> Location service <-----------> Location DB (quadTree vs geohash)
                                                                                - Redis! -> geohashing (high freq of request writes, even distribution)
                                                                                - 100k - 1M TPS
                                                                                - query to get near approximate
                                                                                drivers to be really quick
                                                                                - quadTree(good uneven distribution, uneven
                                                                                distribution and not high write intensive)

6M drivers
3M active
3M / 5 = 600k TPS

Do we need to make requests every 5 secs from driver?
- Proximity?
- Driver dynamic location updates! -> if they are waiting? etc.


CONSISTENCY of matching!!
1. we don't send more than one request at a time for a given ride (while loop in ride matching service)
2. we don't send any driver more than one request at a time (DISTRIBUTION LOCK)

In the Ride Matching service (we have multiple because it's horizontally scaled):

while (noMatch) {
  driver = nextDriver
  lock(driver)
  sendNotification(driver)
  wait(10s)
}


