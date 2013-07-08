# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:

set :output, "log/cron_log.log"

every 1.hours do
  command "/usr/bin/rsync --verbose --archive --delete-delay /datos/smbtramite/01-PROYECTOS/ /datos/local_pdf/"
end

every 2.hours do
#  command "/usr/bin/some_great_command"
#  runner "MyModel.some_method"
  rake "db:seed"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
