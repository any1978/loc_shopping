class ItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  # before_action :set_shop, only: %i[new, :edit update destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_shop_owner!, only: [:new, :edit, :update, :destroy]
  
  def index
    @items = Item.all.order(:name)
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @item = Item.new
    # @item = @shop.items.build(item_params)
  end
  
  def create
    @shop = Shop.find(params[:shop_id])
    @item = @shop.items.build(item_params)
    @item.shop_id = @shop.id
    # @shop = Shop.find(params[:id]) 
    # @shop = current_shop_owner.shop
    # @shop = current_shop_owner.shops(params_id)
    if @item.save
      redirect_to shop_path(@shop.id), notice: '商品を登録しました！'
    else
      render :new
    end
  end

  def confirm

    @shop = Shop.find(params[:shop_id])
    @item = @shop.items.build(item_params)
    render :new if @item.invalid?
  end


  def edit
    # binding.pry
  end

  def update
    # binding.pry
    respond_to do |format|
      if @item.update(item_params)
        format.any { redirect_to shop_item_path, notice: '商品情報を更新しました。' }
        format.json { render :show, status: :ok, location: @item }

	@items = Item.all.order(:name)
	ActionCable.server.broadcast 'items', html: render_to_string('shops/show', layout: false)

      else
        format.any { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    # @item = Item.find(params[:id])
    # binding.pry
    # @shop = Shop.find(params[:shop_id])
    # @items = @shop.items
  end

  def destroy
    @item.destroy
    redirect_to shop_path(@shop.id), notice: '商品を削除しました！'
  end

  private

  def set_item
    @shop = Shop.find(params[:shop_id])
    @item = Item.find(params[:id])
    # @item = @shop.item.find(params[:id])
    # @item = Item.where(shop_id: params[:id])
  end

  def item_params
    # binding.pry
    params.require(:item).permit(:item_id, :shop_id, :name, :price, :stock, :remark, :image, :image_cache, :remove_image)
  end

end
