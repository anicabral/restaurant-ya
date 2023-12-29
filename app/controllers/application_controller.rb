class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo])
  end
#todo lo que hago en app controler los hijos lo heredan.

private
  def set_cart
    # busca si encentra dentro de cart si existe ese numeronde cart id.
    # si encuentra algo tiene que devolver la instancia.
    @cart = Cart.find(session[:cart_id]) #find_by si no encuentra nada me devuelve falso, en lugar de nill.
  rescue ActiveRecord::RecordNoFound # me permite rescatar u error que se haya cometido. y que no se caiga el programa
    @cart = Cart.create
      session[:cart_id]= @cart_id
    #si no encuentra un carrito activo, va a generr un error. lo va a resctar conrescue. y va a crear uno nuevo.
  end

end
