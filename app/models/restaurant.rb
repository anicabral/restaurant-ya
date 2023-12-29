class Restaurant < ApplicationRecord
   # Asociaciones
   belongs_to :user

   has_many :category_restaurants
   has_many :categories, through: :category_restaurants

   has_one_attached :photo
   has_one_attached :logo
   has_many :dishes

   # Validaciones
   validates :name, :address, length: { minimum: 5 }
   validates :description, length: {minimum: 15 }

    # Geocoder
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
    # PG Search
    include PgSearch::Model

    pg_search_scope :global_search,
    against: [ :name, :description, :address ],
    associated_against: {
      categories: [ :name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
