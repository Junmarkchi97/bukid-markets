class Product < ApplicationRecord
  has_many :order_items
  belongs_to :user
  # belongs_to :category

  has_rich_text :description
  has_one_attached :description
  has_many_attached :pictures
end
