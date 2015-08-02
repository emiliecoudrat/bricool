class Rating < ActiveRecord::Base
  belongs_to :bricooler
  belongs_to :customer
end
