class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :avg_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
