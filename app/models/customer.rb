class Customer < ActiveRecord::Base
  has_one :user, :as => :profileable
  accepts_nested_attributes_for :user
  has_many :estimates
  has_many :bookings, dependant: :destroy
  has_many :ratings


  validates :first_name, :last_name, :phone, :zipcode, :city, :bio
  #validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :identity_verified, content_type: [/\Aimage\/.*\z/, "application/pdf"]
  validates_attachment_content_type :licence_verified, content_type: [/\Aimage\/.*\z/, "application/pdf"]


  def full_address
    "#{address}, #{zipcode} #{city}"
  end

  def name
    "#{first_name.nil? ? "" : first_name.capitalize + " "}#{last_name.nil? ? "" : last_name.capitalize}"
  end
end
