class Service < ActiveRecord::Base
  belongs_to :bricooler
  has_many :ratings, through: :bricooler
end
