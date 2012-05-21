class UsrsController < ApplicationController

  # GET /usrs/change_password
  def get_change_password
    # Display a change password form
  end

  # PUT /usrs/put_change_password
  def put_change_password
    @usr = Usr.find(session[:usr_id])
    # authenticate here
    @usr = @usr.try(:authenticate, params[:current_password])
    if @usr.blank?
      flash[:alert] = 'Password remains unchanged. It is not your fault. Maybe try again?'
      # Give the person another chance:
      render :get_change_password
      return
    end
    # change password here
    @usr.password = params[:password]
    @usr.password_confirmation = params[:password_confirmation]
    # Some of Rails has_secure_password magic happens inside of @usr.save:
    if @usr.save.present?
      flash[:notice] = 'Password Changed. Have a nice day.'
      render :show 
      return
    else
      flash[:alert] = 'Password remains unchanged. It is not your fault. Maybe try again?'
      render :get_change_password
      return
    end
  end # def put_change_password

  # GET /usrs
  def index
    # I want all usrs except Guest:
    @usrs = Usr.where("id > 1").order(:name).page params[:page]
  end

  # GET /usrs/get_guest
  def get_guest
    # I want only Guest usr:
    @usr = Usr.find 1
    get_mrks
  end

  # GET /usrs/1
  def show
    @usr = Usr.find(params[:id])
    get_mrks
  end

  # GET /usrs/new
  def new
    @usr = Usr.new
  end

  # GET /usrs/1/edit
  def edit
    @usr = Usr.find(params[:id])
  end

  # POST /usrs
  def create
    @usr = Usr.new(params[:usr])
    if @usr.save
      redirect_to @usr, notice: 'Success! Now, memorize your password. Then go Sign In.'
    else
      render action: "new"
    end
  end

  # PUT /usrs/1
  def update
    @usr = Usr.find(params[:id])

    respond_to do |format|
      if @usr.update_attributes(params[:usr])
        redirect_to @usr, notice: 'Usr was successfully updated.'
      else
        render action: "edit"
      end
    end
  end

  # DELETE /usrs/1
  def destroy
    @usr = Usr.find(params[:id])
    @usr.destroy
    redirect_to usrs_url
  end

  private

  def get_mrks
    if @usr.mrks.blank?
      @mrks = nil
    else
      @mrks = @usr.mrks.order("created_at DESC").page params[:page]
    end # if
  end # def get_marks

end
