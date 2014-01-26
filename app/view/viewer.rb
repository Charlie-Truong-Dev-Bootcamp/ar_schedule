
module ScheduleView
  def self.display_schedule(events)
    puts "Date".ljust(15) + "Start Time".ljust(15) + "End Time".ljust(15) + "Event".ljust(25) + "Cohort"
    events.each do |event|
      puts "#{event.date}".ljust(15) + "#{event.start.strftime("%I:%M %p")}".ljust(15) + "#{event.end.strftime("%I:%M %p")}".ljust(15) + "#{event.event_type.name}".ljust(25) + "#{event.cohort.name}"
    end
  end
end