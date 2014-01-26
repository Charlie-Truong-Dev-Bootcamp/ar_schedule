require_relative '../../config/application'

class Cohort < ActiveRecord::Base
  has_many :boots
  has_many :events
  has_many :event_types, through: :events
end