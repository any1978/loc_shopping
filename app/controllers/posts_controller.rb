class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end


  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def show
    # binding.pry
    @shop = Shop.find(params[:shop_id])
    @post = Post.find(params[:id])
    # @post = .find(params[:id])
    # @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end
  

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :shop_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
