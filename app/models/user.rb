class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name
      user.google_avatar = auth.info.image
      user.username = auth.info.email.split("@")[0]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      # if you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  mount_uploader :avatar, ImgUploader
  has_many :products, :dependent => :destroy
  has_one :address, :dependent => :destroy

  enum role: [:buyer, :seller, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :username, length: { minimum: 3 }, uniqueness: true, presence: true
  validates :bio, length: { maximum: 100 } , allow_blank: true
  
  def set_default_role
    self.role ||= :buyer
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
