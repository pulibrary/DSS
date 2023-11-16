# README

## Local Development Basic Setup

1. ```git clone git@github.com:pulibrary/DSS.git```
1. ```cd DSS```
2. ```asdf install # if you are using asdf```
1. ```bundle install```
1. ```yarn install```
1. ```bundle exec rake dss:servers:start```
1. ```bundle exec rake db:seed```
1. ```bundle exec rake dss:solr:update```
1. ```bundle exec rake dss:solr:index```
2. ```gem install foreman```
1. ```foreman start```

(You may need to install [yarn](https://yarnpkg.com/lang/en/docs/install/#mac-stable) and [foreman](https://github.com/ddollar/foreman) separately, if you haven't already.)

## Production Deployment
Deploy with Capistrano
```bundle exec cap production deploy```
or
```bundle exec cap staging deploy```

## Reindexing in Production

If you need to re-index you can do either of the following.

```bundle exec rake dss:solr:deindex```
```bundle exec rake dss:solr:index```

or if you want to re-index one Resource object at a time

```bundle exec rake dss:solr:reindex```

## Running the tests

```
RAILS_ENV=test bundle exec rake db:setup
bundle exec rspec
```

#### Running system specs in the browser

   ```bash
   RUN_IN_BROWSER=true bundle exec rspec spec/system
   ```
