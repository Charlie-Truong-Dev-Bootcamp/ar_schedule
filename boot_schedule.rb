require 'date'
class Schedule
end

require 'csv'
def csv_loader(csv_file)
  hashes = []
  CSV.foreach(csv_file, :headers => true, :converters => [:date_time], :header_converters => :symbol) do |row|
    hashes << row.to_hash
  end
  hashes
end

if ARGV.any?
  schedule = Schedule.new
  puts schedule.schedule_for(ARGV[0], ARGV[1])
else
  puts "Use the boot schedule like so:"
  puts "ruby boot_schedule.rb today <optional_cohort_name>"
end
