class UsrSessionsController < Devise::SessionsController
  def new
    super
  end

  def create
debugger
    super
    redirect_to :marks_path
  end

  def destroy
debugger
    super
  end
end
