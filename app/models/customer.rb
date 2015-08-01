class Customer < ActiveRecord::Base
  has_one :user, :as => :profileable
  accepts_nested_attributes_for :user
end
