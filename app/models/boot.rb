require_relative '../../config/application'

class Boot < ActiveRecord::Base
  belongs_to :cohort
end