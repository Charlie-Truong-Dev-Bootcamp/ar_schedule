
require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to

class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :events, :start_time
    remove_column :events, :end_time
  end
end