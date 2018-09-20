# README

## Local Development Basic Setup

1. Create mysql databases for test and production (see config/database.yml for default naming conventions)
2. ```git clone git@github.com:pulibrary/DSS.git```
3. ```cd dss```
4. ```bundle install```
5. ```yarn install```
6. ```rake db:create```
7. ```rake db:migrate```
8. ```rake server:dev```
9. ```rake db:seed``` (If you start jetty before running the seed routine the appropriate data will be loaded into solr.)
10. ```foreman start```

## Production
Deploy with capistrano: `bundle exec cap production deploy` or `bundle exec cap staging deploy`
