# Returns an array of hashes from a CSV. Turns dates into Ruby DateTime objects.
require 'csv'
def csv_loader(csv_file)
  hashes = []
  p csv_file
  CSV.foreach(csv_file, :headers => true, :converters => [:date_time], :header_converters => :symbol) do |row|
    hashes << row.to_hash
  end
  hashes
end

class BootScheduleApp
end


puts csv_loader("events.csv")

# We promise there are no errors below this line.
# Don't Touch. Seriously.

if ARGV.any?
  schedule = BootScheduleApp.new
  puts schedule.schedule_for(ARGV[0], ARGV[1])
end