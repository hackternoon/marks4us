class UsersController < ApplicationController

  def index
    # @users = User.all
    @users = User.order(:email).page params[:page]
  end

  def show
    @user = User.select("id,email").find params[:user_id]
    @mrks = @user.mrks.page params[:page]
  end
end
