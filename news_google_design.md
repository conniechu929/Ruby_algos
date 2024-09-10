### Google News System design

## Functional requirements
- create an account and login
- user sets preferences on categories (topics) they want to see articles about
- user sets where they are globally
- user picks what kind of news sites they want to follow (how many?)
- user can see the trending and latest news
- user can search of articles

## Non-functional requirements
- fault tolerant
- scale to 100+ millions of users
- high availability
- low latency (users should not have to wait long to see articles)

## High level design

                                            - forward request to service
Client   ----------> Load balancer ---------> API gateway
- Web               - round robin routing
- mobile


API Gateway -----------> User Service     ------------> user DB 
                        - user sends preferences      - user_id
                        - user sends sites they       - user_preferences
                        want to get articles from     - user_location
                        - user sends their location   - user_sites


API Gateway ------------> News Service  ------> MongoDB ---> s3 (media)
                         - latest news
                         - trending
                         - show categories
                         - show different sites                        

                         Message queue -----------------------> News DB
                         - 




API Gateway -----------> Search service