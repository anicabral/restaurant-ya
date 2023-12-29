class LineItemsController < ApplicationController
before_action :set_cart, only: :create

  def create
    dish = Dish.find(params[:dish_id])
    @line_item = @cart.add_product(dish)
    redirect_to cart_path(@cart.id) #redirect al show.
      if @line_item.save
        redirect_to cart_path(@cart.id)
      end
  end
end
