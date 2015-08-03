class Bricooler < ActiveRecord::Base
  has_one :user, :as => :profileable
  accepts_nested_attributes_for :user
  has_many :availabilities, dependant: :destroy
  has_many :ratings
  has_many :services
  has_many :bookings, through: :services
end
