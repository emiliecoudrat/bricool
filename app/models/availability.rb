class Availability < ActiveRecord::Base
  belongs_to :bricooler
  belongs_to :booking

  validates :bricooler_id, :start_date, :end_date, :start_hour, :end_hour, presence: true
end
