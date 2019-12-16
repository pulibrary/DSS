# README

## Local Development Basic Setup

1. Create mysql databases for test and production (see config/database.yml for default naming conventions)
2. ```git clone git@github.com:pulibrary/DSS.git```
3. ```cd dss```
4. ```bundle install```
5. ```rake db:create```
6. ```rake db:migrate```
7. ```rake db:seed```
8. ```rake rake:server:dev```
9. ```rake dss:solr:update```
10. ```rake dss:solr:index```
11. ```yarn install```
12. ```foreman start```

(You may need to install [yarn](https://yarnpkg.com/lang/en/docs/install/#mac-stable) and [foreman](https://github.com/ddollar/foreman) separately, if you haven't already.)

## Production Deployment
Deploy with Capistrano
```bundle exec cap production deploy```
or
```bundle exec cap staging deploy```

## Reindexing in Production

If you need to re-index you can do either of the following.

```rake dss:solr:deindex```
```rake dss:solr:index```

or if you want to re-index one Reseource object at a time

```rake dss:solr:reindex```
