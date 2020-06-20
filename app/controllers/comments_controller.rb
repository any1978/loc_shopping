class CommentsController < ApplicationController
  def index
  end

  def create

    #コメント機能の場合
    @shop = Shop.find(params[:shop_id])
    # @user = User.find(params[:user_id])
    @comment = @shop.comments.build#(comment_params)
    @comment.user_id = current_user.id
    binding.pry
    if @comment.save
      # render :index
      redirect_to shop_comments_path
    else
      
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
      params.require(:comment).permit(:content, :reply_comment).merge(user_id: current_user.id, shop_id: params[:product_id])
    end
end
