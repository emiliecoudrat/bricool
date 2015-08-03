class Rating < ActiveRecord::Base
  belongs_to :bricooler
  belongs_to :customer
  has_one :service, through: :bricooler
end
