class RestaurantsController < ApplicationController
  def index
    # voy a hacer un cambio en el index para que funcione el buscador
    if params[:query].present?
      @restaurants = Restaurant.global_search(params[:query]) #vas a crear esta variable, pero no vas a traer a todos, sino los que esten en elbuscador
    else
       @restaurants = Restaurant.all #si no hay algo presente que me traiga todos los restaurantes
    end
    @markers = @restaurants.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  # get /restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
    @markers = [
      {
        lat: @restaurant.latitude,
        lng: @restaurant.longitude
      }]
      # [{ lat: 435.3, lng: 43.56 }]
  end

  def new
    @restaurant = Restaurant.new
    @categories = Category.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new, status: :unprocessable_entity # para que elususario sepa porque no le esta guardando.
    end
  end

  #/restaurants/:id/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
    @categories = Category.all
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant.id) #cada vez que quiero ir a un show, edit o destroy tngo que pasar el id en el def
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  def my_restaurants
    @restaurants = Restaurant.where(user_id: current_user.id) #el usuario sea el del usuario loggeado.
  end

private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :photo, category_ids:[])
  end
end
