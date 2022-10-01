class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  mount_uploader :avatar, ImgUploader
  has_many :orders
  has_many :products
  has_one :user_address

  enum role: [:buyer, :seller, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  def set_default_role
    self.role ||= :buyer
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
