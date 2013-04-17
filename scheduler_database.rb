require 'fileutils'
require 'sqlite3'

class SchedulerDatabase
  DATABASE_FILE_NAME = "events.db"

  attr_reader :connection
  def initialize
    @connection = SQLite3::Database.new(DATABASE_FILE_NAME)
  end

  def delete_and_create!
    puts "Purging the old data!"
    FileUtils.rm(DATABASE_FILE_NAME)

    puts "Creating a new database!"
    FileUtils.touch(DATABASE_FILE_NAME)

    create_tables!
  end

  def create_tables!
    sql_to_create_cohort_table = "CREATE TABLE cohorts (" +
      "WUT FIELDS GO HERE?!" +
      ")"
    connection.execute(sql_to_create_cohort_table)
    raise "OK! Now create tables for the other tables in your schema"
  end
end