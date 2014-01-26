require_relative '../../config/application'

class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :cohort

  def self.request_all_cohorts_on(date)
    Event.includes(:event_type, :cohort).where(date: date).order(:start)
  end

  def self.request_a_cohort_on(date, cohort_name)
    Event.includes(:event_type, :cohort).where(date: date, cohorts: {name: cohort_name}).order(:start)
  end

  def self.request_all_cohorts_for_week(date)
    week = dates_in_week(date)
    Event.includes(:event_type, :cohort).where(date: week).order(:date, :start)
  end

  def self.request_a_cohort_for_week(date, cohort_name)
    week = dates_in_week(date)
    Event.includes(:event_type, :cohort).where(date: week, cohorts: {name: cohort_name}).order(:date, :start)
  end

  def self.dates_in_week(date)
    days = Array.new
    day_of_week = date.cwday
    date_in_week = date - day_of_week
    5.times{days.push(date_in_week += 1)}
    days
  end
end
