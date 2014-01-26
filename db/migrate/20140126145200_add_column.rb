
require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to

class AddColumn < ActiveRecord::Migration
  def change
    add_column :events, :date,  :date
    add_column :events, :start, :time
    add_column :events, :end,   :time
  end
end