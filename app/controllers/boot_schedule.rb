require 'date'
require_relative '../models/boot'
require_relative '../models/cohort'
require_relative '../models/event'
require_relative '../models/event_type'
require_relative '../view/viewer'

#date artifically set to 2013-04-16 until live schedule data available
today = Date.new(2013,4,19)

case ARGV[0]
when 'today'
  ARGV[1].nil? ? events = Event.request_all_cohorts_on(today) : events = Event.request_a_cohort_on(today, ARGV[1])
  ScheduleView.display_schedule(events)
when 'week'
  ARGV[1].nil? ? events = Event.request_all_cohorts_for_week(today) : events = Event.request_a_cohort_for_week(today, ARGV[1])
  ScheduleView.display_schedule(events)
else
  puts "Use the boot schedule like so:"
  puts "ruby boot_schedule.rb today/week <optional_cohort_name>"
end
