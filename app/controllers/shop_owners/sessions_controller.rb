# frozen_string_literal: true

class ShopOwners::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  # def new
  #   super
  # end

  # # POST /resource/sign_in
  # def create
  #   # super
  #   # binding.pry
  #   # redirect_to shop_owner_path(ShopOwner.id)
  # end

  # # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # def after_sign_in_path_for(resource)
  #   binding.pry
  #   redirect_to shop_owner_path(resource) and return
  # end 

  # #ログアウト後のリダイレクト先
  
  # def after_sign_out_path_for(resource)
  #   redirect_to shop_owners_path
  # end 

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  # private
  # def session_params
  #   params.permit(:email, :password)
  # end

end
