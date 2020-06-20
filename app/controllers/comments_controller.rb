class CommentsController < ApplicationController
  def index
  end

  def create

    #コメント機能の場合
    @shop = Shop.find(params[:shop_id])
    # @post = Post.find(params[:post_id]) #①
    @comment = @shop.comments.build(comment_params) #②
    @comment.user_id = current_user.id #③
    if @comment.save
      render :index #④
    end

    #チャットルーム式機能の場合
    # @room = Room.find(params[:room_id])
    # @message = Message.new(message_params)
    # #メッセージがuserによるものだったらis_user=true, shopによるものだったらis_user=false
    # if user_signed_in?
    #   @message.is_user = true
    # elsif shop_owner_signed_in?
    #   @message.is_user = false
    # end
    # @message.room_id = @room.id
    # if @message.save
    #   redirect_to room_url(@room)
    # else
    #   redirect_to room_url(@room)
    # end

  end

  def destroy
    @comment = Comment.find(params[:id]) #⑤
    if @comment.destroy
      render :index #⑥
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
