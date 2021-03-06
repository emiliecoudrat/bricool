class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  belongs_to :profileable, polymorphic: true
  accepts_nested_attributes_for :profileable
  validates :email, presence: true

  # has_many :estimates, through: :customer #ajouté pour créer lien user/estimate
  # has_many :services, through: :bricooler #ajouté pour créer lien user/service


  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.name = auth.info.name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

   def bricooler?
    if profileable_type == 'Bricooler'
      true
    end
  end

  def customer?
    if profileable_type == 'Customer'
      true
    end
  end

end
