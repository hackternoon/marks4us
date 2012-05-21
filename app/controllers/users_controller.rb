class UsersController < ApplicationController

  def index
    @users = User.order(:email).page params[:page]
  end

  def show
    @user = User.select("id,email").find params[:user_id]
    if @user.mrks.blank?
      @mrks = nil
    else
      @mrks = @user.mrks.page params[:page]
    end # if
  end # def show
end
