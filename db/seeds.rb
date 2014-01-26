require 'csv'
require_relative '../app/models/boot'
require_relative '../app/models/cohort'
require_relative '../app/models/event'
require_relative '../app/models/event_type'
require 'debugger'

def load_cohorts(filename)
  CSV.table(filename).each do |row|
    Cohort.create(Hash[row])
  end
end

def load_boots(filename)
  CSV.table(filename).each do |row|
    data = Hash.new
    data[:first_name] = row[:first_name]
    data[:last_name]  = row[:last_name]
    data[:email]      = row[:email]
    data[:cohort_id]  = Cohort.find_by(name: row[:cohort]).id
    Boot.create(data)
  end
end

def load_event_type(filename)
  event_types = CSV.table(filename).map{|row|row[:name]}.uniq
  event_types.each{|event| EventType.create({name: event})}
end

def load_events(filename)
  CSV.table(filename).each do |row|
    data = Hash.new
    data[:date]           = row[:start_time].to_date
    data[:start]          = row[:start_time]
    data[:end]            = row[:end_time]
    data[:event_type_id]  = EventType.find_by(name: row[:name]).id

    if row[:cohorts].include?(',')
      load_two_cohort_events(data,row)  
    else
      data[:cohort_id]  = Cohort.find_by(name: row[:cohorts]).id
      Event.create(data)
    end
  end
end

def load_two_cohort_events(data, row)
    cohorts           = row[:cohorts].split(',')
    data[:cohort_id]  = Cohort.find_by(name: cohorts[0]).id
    Event.create(data)
    data[:cohort_id] = Cohort.find_by(name: cohorts[1]).id
    Event.create(data)
end

def split_date_time_events
  Event.all.each do |event|
    event.date    = event.start_time.to_date
    event.start   = event.start_time.to_time
    event.end     = event.end_time.to_time
    event.save
  end
end

# filename=File.dirname(__FILE__) + "/data/cohorts.csv"
# load_cohorts(filename)

# filename=File.dirname(__FILE__) + "/data/boots.csv"
# load_boots(filename)

# filename=File.dirname(__FILE__) + "/data/events.csv"
# load_event_type(filename)

filename=File.dirname(__FILE__) + "/data/events.csv"
load_events(filename)

#split_date_time_events