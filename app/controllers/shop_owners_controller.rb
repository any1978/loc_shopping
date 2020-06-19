class ShopOwnersController < ApplicationController
  # before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_shop_owner, only: [:edit, :show, :update, :destroy]

  def new
    @shop_owner = ShopOwner.new
  end

  def index
  end

  def create
  end
  
  def show
    # binding.pry
    @shop_owner = ShopOwner.find(params[:id])
    @shops = @shop_owner.shops
    # @items = @shops.item
    # @items = @shops[0][:item].to_i
  end

  # def update
    
  #   binding.pry
    
  #   super
  #   # if @shop_owner.update(shop_owner_params)
  #   #   flash[:notice] = "オーナー情報を編集しました"
  #   #   redirect_to shop_owner_path
  #   # else
  #   #   render("shop_owners/edit")
  #   # end
  # end

  private

  def shop_owner_params
    params.require(:shop_owner).permit(:name, :email, :password,
                                :password_confirmation)
  end 

  def set_shop_owner
    # binding.pry
    @shop_owner = ShopOwner.find(params[:id])
  end
end
