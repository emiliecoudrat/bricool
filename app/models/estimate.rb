class Estimate < ActiveRecord::Base
  belongs_to :customer

  validates :title, :description, :customer_id, presence: true
end
