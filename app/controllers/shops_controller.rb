class ShopsController < ApplicationController

  include CurrentCart
  before_action :set_cart
  before_action :set_shop, only: %i[show edit update destroy]
  before_action :authenticate_shop_owner!, only: %i[new edit update destroy]

  def index

    # @search = Shop.ransack(params[:q])
    # @shops = @search.result

    @shops = Shop.all

    #geocode search
    # @shops = Shop.where(active: true).limit(10)


    # if user_signed_in?(current_user.id)
    #   @shops_address = Shop.near(session[:loc_search], 2, order: 'distance')

    # end

    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end
    if session[:loc_search] && session[:loc_search] != ""
      @shops_address = Shop.near(session[:loc_search], 2, order: 'distance')
    else
      @shops_address = Shop.all
    end
# binding.pry
    @search = @shops_address.ransack(params[:q])
    # @search = Shop.ransack(params[:q])
    # binding.pry
    @shops = @search.result
    # @shops = Shop.all
    # @arrShops = @shops.to_a

    if params[:search] == ""
      @shops = Shop.all
    end
  end

  def new
    @shop = Shop.new
    # @shop = current_shop_owner.shops.build
    # if params[:back]
    #   @shop = Shop.new(shop_params)
    # else
    #   @shop = Shop.new
    # end
  end

  def create
    @shop = current_shop_owner.shops.build(shop_params)
    @shop.address = @shop.prefecture_code + @shop.address_city
    @shop.address = @shop.address.gsub(/\d+/, "").gsub(/\-+/, "")
    if @shop.save
      # binding.pry
      redirect_to shop_owner_path(current_shop_owner.id), notice: "ショップ情報を作成しました！"
    else
      render :new
    end
  end

  def confirm
    # binding.pry
    @shop = current_shop_owner.shops.build(shop_params)
    # redirect_to shops_path(current_shop_owner.id)
    render :new if @shop.invalid?
  end 

  def show
    @items = Item.where(shop_id: params[:id])
    @comment = Comment.new
    @comments = @shop.comments

    @shop_owner_comments = @shop.shop_owner_comments
    @shop_owner_comment = @shop.shop_owner_comments.build
    #コメント追加
    # @new_comments = Comment.new
    if user_signed_in?
      @favorite = current_user.favorites.find_by(shop_id: @shop.id)
    end
  end
  
  def edit
  end

  def update
    @shop.address = @shop.prefecture_code + @shop.address_city
    @shop.address = @shop.address.gsub(/\d+/, "").gsub(/\-+/, "")
    # binding.pry
    if @shop.update(shop_params)
      redirect_to shop_owner_path(current_shop_owner.id), notice: "ショップ情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
  # @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shop_owner_path(current_shop_owner.id), notice:"ショップを削除しました！"
  end

  def search
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    if session[:loc_search] && session[:loc_search] != ""
      @shops_address = Shop.where(active: true).near(session[:loc_search], 2, order: 'distance')
    else
      @shops_address = Shop.where(active: true).all
    end

    @search = @shops_address.ransack(params[:q])
    @shops = @search.result

    @arrShops = @shops.to_a
  end

  # def map
  #   results = Geocoder.search(params[:address_city])
  #   @latlng = results.first.coordinates
  #   # respond_to以下の記述によって、
  #   # remote: trueのアクセスに対して、
  #   # map.js.erbが変えるようになります。
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  private

  def shop_params
    params.require(:shop).permit(:name, :introduction, :image, :image_cache, :remove_image,
                              :profile_image, :profile_image_cache, :remove_profile_image,
                              :email, :postcode, :prefecture_code, :address_city, :address_street,
                              :address_building, :address, :phone_number, :latitude, :longitude, :message)
  end

  def set_shop
    # binding.pry
    @shop = Shop.find(params[:id])
  end

end
