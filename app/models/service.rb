class Service < ActiveRecord::Base
  belongs_to :bricooler
  has_many :ratings, through: :bricooler

  validates :names, :category, :price, presence: true
end
