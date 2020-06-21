class CommentsController < ApplicationController
  def index
  end

  def create
    # binding.pry
    @shop = Shop.find(params[:shop_id])
    # @comment = @shop.comments.build(params[:comment_id])
    # binding.pry
    @comment = @shop.comments.build(comment_params)
    if user_signed_in?
      @comment.user_id = current_user.id
      # binding.pry
      if @comment.save
        render :index
        # redirect_to shop_comments_path
      else
      end
    elsif shop_owner_signed_in?
      @comment.shop_owner_id = current_shop_owner.id
      if @comment.save
        render :index
        # redirect_to shop_comments_path
      else
      end
    end
  end

  # def update
  #     if @user.update(user_params)
  #   flash[:success] = "Your account was updated"
  #   redirect_to @user
  # else
  #   render 'edit'
  # end
  # end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
    # redirect_to "/products/#{@comment.product.id}"
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_id, :content, :reply_comment, :shop_id, :user_id, :shop_owner)#.merge(user_id: current_user.id, shop_id: params[:shop_id])
    end
end
