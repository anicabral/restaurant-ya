class Restaurant < ApplicationRecord
   # Asociaciones
   belongs_to :user
   has_many :category_restaurants
   has_many :categories, through: :category_restaurants
   has_one_attached :photo

   # Validaciones
   validates :name, :address, length: { minimum: 5 }
   validates :description, length: {minimum: 15 }
end
