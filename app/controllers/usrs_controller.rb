class UsrsController < ApplicationController
  # GET /usrs
  def index
    @usrs = Usr.all
  end

  # GET /usrs/1
  def show
    @usr = Usr.find(params[:id])
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
end
