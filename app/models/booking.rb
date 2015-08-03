class Booking < ActiveRecord::Base
  belongs_to :service
  belongs_to :customer

  validates :service_id, :customer_id, :day, :start_hour, :end_hour, presence: true
end
