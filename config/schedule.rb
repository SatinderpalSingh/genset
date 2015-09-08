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

# Learn more: http://github.com/javan/wheneveri
set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

# Below code is commented by vigas as there is no need for email by cron.
#job_type :runner, "cd /home/shaina/GenSys && bin/rails runner -e :environment ':task' :output"

##every 1.month, :at => "start of the month at 12am" do
#every 2.minutes do
#    runner "QtMailer.email_at_intervals.deliver" 
#end
