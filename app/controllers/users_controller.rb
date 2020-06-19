class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @user = current_user.id
  end
end
