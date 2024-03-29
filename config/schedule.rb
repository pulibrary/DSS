# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
set :job_template, "bash -l -c 'export PATH=\"/usr/local/bin/:$PATH\" && :job'"

job_type :logging_rake, 'cd :path && :environment_variable=:environment bundle exec rake :task :output'

every 1.day, at: '11pm', roles: [:db] do
  logging_rake 'dss:clean:guest_users', output: { error: '/tmp/clean_guest_users.log', standard: '/tmp/clean_guest_users.log' }
  logging_rake 'blacklight:delete_old_searches', output: { error: '/tmp/clean_old_searches.log', standard: '/tmp/clean_old_searches.log' }
end
