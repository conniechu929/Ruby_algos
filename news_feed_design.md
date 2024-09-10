## System design of a news feed

### Functional requirements
- Display articles to users
- Should display articles to user based of location and their interests
- Display trending news
- Allows users to search for articles
- Should have categories of different news articles
- Gather news articles from the web
- Should be able to extract title, body and media links from an HTML page
- Should not crawl the articles which are already crawled
- Scale:
  

### Nonfunctional requirements
- low latency
- high availability
- fault tolerant -> robust
- scale to how many?
- efficiently crawl and load
  - do not crawl if already crawled url
  - don't parse webpage with duplicate content and was already parsed

# core entities:
- text data
- video data
- image data
- user data

# Interface
- input user location
- user preferences
- user inputs in search

- output: page with articles, trending page, categories of articles

# Data flow: SPEND TIME ON (HIGH LEVEL)
- user sends location
- user selects subscriptions
- user selects preferences
- RSS feeds (to stay up to date with news websites) with a sitemap manager service
  - a list of news sites that the user picks to follow
  - all news sites related to the geolocation of the user
  - goes and grabs HTML articles
  - 
- fetch html
- extract text from HTML
- store text in database

* How do we scale?
- example: If we need to web crawl about 1000 pages
400Gbps 2MB per page
400Gbps/(8bits/byte)/2MB/page = 25k pages/s
lets just say we utilize 30% of that
25k pages/s *0.3 = 10k
10^2/10^4= 0.001s = 1ms
