class Category < ApplicationRecord
  # Asociaciones
  has_many :category_restaurants
  has_many :restaurants, through: :category_restaurants
end
