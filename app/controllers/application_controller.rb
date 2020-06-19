class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # helper_method :current_cart

  def after_sign_in_path_for(resource)
    # binding.pry
    if shop_owner_signed_in?
      shop_owner_path(resource) #and return
    elsif user_signed_in?
      shops_path
    else
      new_user_session_path
    end
  end
  
  # def current_cart
  #   if session[:cart_id]
  #     @cart = Cart.find(session[:cart_id])
  #   else
  #     @cart = Cart.create
  #     session[:cart_id] = @cart.id
  #   end
  # end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :first_name, :last_name, :phone_number, 
                    :postcode, :prefecture_code, :address_city, :address_street, :address_building, :address, :password, :password_confirmation, :number_of_store ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
