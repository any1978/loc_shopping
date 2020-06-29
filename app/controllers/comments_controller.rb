class CommentsController < ApplicationController
  before_action :set_shop, only: [:create, :edit, :update, :destroy]

  def index
  end

  def create
    # @shop = Shop.find(params[:shop_id])
    @comment = @shop.comments.build(comment_params)
    if user_signed_in?
      @comment.user_id = current_user.id
      if @comment.save
        render :index
      else
      end
    end
  end

  def edit
    @comment = @shop.comments.find(params[:id])
    # binding.pry
    respond_to do |format|
      # flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @shop.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index, notice:"コメントを削除しました！"
    end
    # redirect_to "/products/#{@comment.product.id}"
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :shop_id, :user_id)#.merge(user_id: current_user.id, shop_id: params[:shop_id])
    end
    def set_shop
      @shop = Shop.find(params[:shop_id])
    end
end
