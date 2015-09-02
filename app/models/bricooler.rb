class Bricooler < ActiveRecord::Base
  has_one :user, :as => :profileable

  has_many :availabilities, dependent: :destroy
  has_many :ratings
  has_many :services
  has_many :bookings, through: :services
  accepts_nested_attributes_for :user, :services

  #validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  #validates :first_name, :last_name, :phone, :address, :zipcode, :city, :bio


  def name
    "#{first_name.nil? ? "" : first_name.capitalize + " "}#{last_name.nil? ? "" : last_name.capitalize}"
  end

end
