
require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to

class CreateTables < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :start_date
      t.date :graduation_date
      t.timestamps
    end


    create_table :boots do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :cohort_id
      t.belongs_to :cohort
      t.timestamps
    end

    add_index :boots, :cohort_id

    create_table :event_types do |t|
      t.string :name
      t.timestamps
    end

    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :cohort_id
      t.integer :event_type_id
      t.belongs_to :cohort
      t.belongs_to :event_type
      t.timestamps
    end

    add_index :events, :cohort_id
    add_index :events, [:event_type_id, :cohort_id]
  end
end