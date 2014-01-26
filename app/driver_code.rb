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



# Driver code for part 2! Uncomment when you get to Part 2!

# require_relative 'scheduler_database'
# database = SchedulerDatabase.new
# database.delete_and_create!
# database.populate_from_csvs!
 
# csv_cohorts = csv_loader("cohorts.csv")
# db_cohorts = database.cohorts
# db_cohorts.size == csv_cohorts.size


# print "Did we load all the cohorts into the database? "
# puts db_cohorts.size == csv_cohorts.size



# csv_boots = csv_loader("boots.csv")
# db_boots = database.boots
# db_boots.size == csv_boots.size

# print "Did we load all the boots into the database? "
# puts db_boots.size == csv_boots.size



# csv_events = csv_loader("events.csv")
# db_events = database.events

# print "Did we load all the events into the database? "
# puts db_events.size == csv_events.size