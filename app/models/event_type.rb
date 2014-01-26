require_relative '../../config/application'

class EventType < ActiveRecord::Base
  has_many :events
  has_many :cohorts, through: :events
end
