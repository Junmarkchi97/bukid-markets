class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_rich_text :description
  has_one_attached :description
  
  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { in: 1..1000 }, allow_blank: true
  validates :price, presence: true
  validates :thumbnail, presence: true

  mount_uploader :thumbnail, ImgUploader
end
