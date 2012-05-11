class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.select("id,email").find params[:user_id]
    # Do this in the view: @mrks = @user.mrks
  end
end
