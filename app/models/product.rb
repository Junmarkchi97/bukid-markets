class Product < ApplicationRecord
  has_many :order_items
  has_rich_text :description
  has_one_attached :description

end
