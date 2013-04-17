require_relative 'boot_schedule'

boot_schedule = Schedule.new

puts "*" * 50
puts "All Cohort's schedule for today"
puts boot_schedule.schedule_for("Today")

# This should look something like...
# Mon, Apr 25 9:00am ~ 10:00am, Yoga - Alpha
# Mon, Apr 25 9:00am ~ 10:00am, Guest Lecture - Beta, Gamma
# Mon, Apr 25 12:00pm ~ 1:30pm, Yoga - Beta
# ... etc. ...
# Mon, Apr 25 6:30pm ~ 8:00pm, Engineering Empathy - Gamma

puts "*" * 50
puts "Cohort Gamma's schedule for today"
puts boot_schedule.schedule_for("Today", "Gamma")


puts "*" * 50
puts "Cohort Beta's schedule for the week"
puts boot_schedule.schedule_for("Week", "Beta")

# You'll notice it only includes events that are for Beta and has all the events for the current week
# This should look something like...
# Mon, Apr 25 9:00am ~ 10:00am, Guest Lecture - Beta, Gamma
# Mon, Apr 25 12:00pm ~ 1:30pm, Yoga - Beta
# ... etc. ...
# Tue, Apr 26 9:00am ~ 10:00am, Lecture - Beta
# ... etc. ...
# Fri, Apr 29 9:00am ~ 10:00am, Lecture - Beta

puts "*" * 50
puts "Cohort Alpha's schedule for the week"
puts boot_schedule.schedule_for("Week", "Alpha")
