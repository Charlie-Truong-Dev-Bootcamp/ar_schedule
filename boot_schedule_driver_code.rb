require_relative 'boot_schedule'
# Doth not changeth this file. It is your guide.

boot_schedule = BootScheduleApp.new
puts boot_schedule.schedule_for("Today")

# This should look something like...
# 1. Mon, Apr 25 9:00am ~ 10:00am, Yoga - Alpha
# 2. Mon, Apr 25 9:00am ~ 10:00am, Guest Lecture - Beta, Gamma
# 3. Mon, Apr 25 12:00pm ~ 1:30pm, Yoga - Beta
# ... etc. ...
# 8. Mon, Apr 25 6:30pm ~ 8:00pm, Engineering Empathy - Gamma

puts boot_schedule.schedule_for("Week", "Beta")

# You'll notice it only includes events that are for Beta and has all the events for the current week
# This should look something like...
# 2. Mon, Apr 25 9:00am ~ 10:00am, Guest Lecture - Beta, Gamma
# 3. Mon, Apr 25 12:00pm ~ 1:30pm, Yoga - Beta
# ... etc. ...
# 12. Tue, Apr 26 9:00am ~ 10:00am, Lecture - Beta
# ... etc. ...
# 35. Fri, Apr 29 9:00am ~ 10:00am, Lecture - Beta


puts boot_schedule.schedule_for("Phase", "Gamma")
# 2. Mon, Apr 25 9:00am ~ 10:00am, Guest Lecture - Beta, Gamma
# 8. Mon, Apr 25 6:30pm ~ 8:00pm, Engineering Empathy - Gamma
# ..etc...
# 153. Mon, May 2 9:00am ~ 10:00am, Yoga - Gamma
# ..etc... til the end of the phase
