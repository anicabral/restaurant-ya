class Cart < ApplicationRecord
  has_many :line_items

  def add_product(dish) #con ese plato que voy a recibir voy a crear unavriable
    current_item = LineItem.find_by(dish_id: dish.id)
    #si existe la instania es porque esta añadido. si devuelve nill es porque no está.
    if current_item
      current_item.quantity += 1 #si existe agrega 1 en cantidad
    else #si no existe, tengo que crearlo
      current_item = line_items.build(dish_id: dish.id, price: dish.price)
    end
    current_item
  end
end
