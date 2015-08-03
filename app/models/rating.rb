class Rating < ActiveRecord::Base
  belongs_to :bricooler
  belongs_to :customer
  has_one :service, through: :bricooler

  validates :average_mark, :bricooler_id, :customer_id, presence: true
end
