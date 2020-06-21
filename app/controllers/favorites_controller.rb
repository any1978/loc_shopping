class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites#.order(:name)
  end
  def create
    favorite = current_user.favorites.create(shop_id: params[:shop_id])
    redirect_to shop_path(params[:shop_id]), notice: "#{favorite.shop.name}をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to shop_path(params[:shop_id]), notice: "#{favorite.shop.name}をお気に入り解除しました"
  end
end
