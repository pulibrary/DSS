# README

## Local Development Basic Setup

1. Create mysql databases for test and production (see config/database.yml for default naming conventions)
2. ```git clone git@github.com:pulibrary/DSS.git```
3. ```cd dss```
4. ```bundle install```
5. ```rake db:create```
6. ```rake db:migrate```
7. ```rake db:seed``` 
8. ```rake rake:server```
9. ```rake dss:solr:update```
10. ```rake dss:solr:index```

## Production
Integrated with capistrano
```bundle exec rake cap production deploy```
or
```bundle exec rake cap staging deploy```
