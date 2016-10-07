# README

## Local Development Basic Setup

1. Create mysql databases for test and production (see config/database.yml for default naming conventions)
2. ```git clone git@github.com:pulibrary/DSS.git```
3. ```cd dss```
4. ```bundle install```
5. ```rake db:create```
6. ```rake db:migrate```
7. ```rake jetty:download```
8. ```rake jetty:unzip```
9. ```rake jetty:start```
10. ```rake db:seed``` (If you start jetty before running the seed routine the appropriate data will be loaded into solr.)
11. ```rails s```

## Production
TBD
