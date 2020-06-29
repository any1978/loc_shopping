class ShopOwnerCommentsController < ApplicationController
  before_action :set_shop, only: [:create, :edit, :update, :destroy]

  def create
    @shop = Shop.find(params[:shop_id])
    @shop_owner_comment = @shop.shop_owner_comments.build(shop_owner_comment_params)
    @shop_owner_comment.shop_owner_id = current_shop_owner.id
    @shop_owner_comments = ShopOwnerComment.where(shop_id: params[:shop_id]).all.order(created_at: :desc)
    respond_to do |format|
      if @shop_owner_comment.save
        # flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        format.js { render :error }
      end
    end
  end

  def edit
    @shop_owner_comment = @shop.shop_owner_comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @shop_owner_comment = @shop.shop_owner_comments.find(params[:id])
      respond_to do |format|
        if @shop_owner_comment.update(shop_owner_comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @shop_owner_comment = ShopOwnerComment.find(params[:id])
    @shop_owner_comment.destroy
    @shop_owner_comments = ShopOwnerComment.where(shop_id: params[:shop_id]).all.order(created_at: :desc)
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def shop_owner_comment_params
    params.require(:shop_owner_comment).permit(:content, :shop_id)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
