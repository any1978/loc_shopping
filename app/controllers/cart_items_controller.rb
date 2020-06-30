class CartItemsController < ApplicationController

	include CurrentCart
	before_action :set_cart, only: [:create]
	before_action :set_cart_item, only: [:show, :edit, :update, :destroy]


  def index
    @cart_items = CartItem.all
  end

  def show
  end

  def new
    @cart_item = CartItem.new
  end

  def edit
  end

  def create
    # binding.pry
    item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(item)

    respond_to do |format|
      if @cart_item.save
        format.any { redirect_to shop_path(params[:shop_id]) }
        format.js{ @current_item = @line_item }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.any { redirect_to @cart_item, notice: '品目が更新されました。' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: '品目を破棄しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :cart_id)
    end
end