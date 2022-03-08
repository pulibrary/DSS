# README

## Local Development Basic Setup

1. ```git clone git@github.com:pulibrary/DSS.git```
1. ```cd DSS```
1. ```bundle install```
1. ```yarn install```
1. ```rake dss:servers:start```
1. ```rake db:seed```
1. ```rake dss:solr:update```
1. ```rake dss:solr:index```
1. ```foreman start```

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

or if you want to re-index one Resource object at a time

```rake dss:solr:reindex```
