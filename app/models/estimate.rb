class Estimate < ActiveRecord::Base
  belongs_to :customer

  validates :title, :description, :customer_id, presence: true

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
