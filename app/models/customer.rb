class Customer < ActiveRecord::Base
  has_one :user, :as => :profileable
  accepts_nested_attributes_for :user
  has_many :estimates
  has_many :bookings, dependant: :destroy
  has_many :ratings
end
