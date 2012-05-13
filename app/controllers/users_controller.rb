class UsersController < ApplicationController

  def index
    # @users = User.all
    @users = User.order(:email).page params[:page]
  end

  def show
    @user = User.select("id,email").find params[:user_id]
    # Do this in the view: @mrks = @user.mrks
  end
end
