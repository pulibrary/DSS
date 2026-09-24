# DSS

## Application
This application provides access to the data sets that are managed by the Library's [Data and Statistical Services](https://library.princeton.edu/services/data-and-statistical-services) unit. Access to the materials is restricted to currently enrolled/employed members of Princeton University. 

## Local Development Basic Setup

This repo ships a `devbox.json` that provisions Ruby, Node/Yarn, PostgreSQL client libs, and native build deps needed by Rails, Nokogiri, pg, Vite

## Prereqs

  * macOS/Linux with Devbox installed: https://www.jetify.com/devbox/docs/install/

  * Docker, to run services in containers

> We previously used `asdf`/`mise`. Those files can remain in the repo, but Devbox is now the canonical workflow.

## Quickstart

```bash
git clone git@github.com:pulibrary/DSS.git
cd DSS

# enter the dev environment
devbox shell

# install Ruby gems and JS deps
devbox run setup

# seed and index (first-time setup)
bundle exec rake db:seed
bundle exec rake dss:solr:update
bundle exec rake dss:solr:index

# run Vite and Rails in separate terminals
devbox run vite:dev         # terminal 1
devbox run rails:server     # terminal 2 (http://localhost:3000)
```

(You may need to install [yarn](https://yarnpkg.com/lang/en/docs/install/#mac-stable) separately, if you haven't already.)

### Making yourself an admin user
- If you have not yet logged in, bring the rails server up, and log in to the application via the UI
- Go on the rails console `bundle exec rails c`
- Find your user and assign it the role of 'admin'
```ruby
user = User.find_by(uid: "YOUR_UID")
user.role = 'admin'
user.save!
```

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
