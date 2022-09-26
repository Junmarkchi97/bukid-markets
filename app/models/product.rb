class Product < ApplicationRecord
  has_many :order_items
  has_rich_text :description
end
