class PostsController < ApplicationController

  def show
    binding.pry
    @shop = Shop.find(params[:shop_id])
    @post = @shop.posts.find(params[:id])
    # @post = Post.find(params[:id])
    @comment = Comment.new #①
    @comments = @post.comments #②
  end
  
end
