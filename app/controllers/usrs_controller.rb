class UsrsController < ApplicationController
  # GET /usrs
  # GET /usrs.json
  def index
    @usrs = Usr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usrs }
    end
  end

  # GET /usrs/1
  # GET /usrs/1.json
  def show
    @usr = Usr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usr }
    end
  end

  # GET /usrs/new
  # GET /usrs/new.json
  def new
    @usr = Usr.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usr }
    end
  end

  # GET /usrs/1/edit
  def edit
    @usr = Usr.find(params[:id])
  end

  # POST /usrs
  # POST /usrs.json
  def create
    @usr = Usr.new(params[:usr])

    respond_to do |format|
      if @usr.save
        format.html { redirect_to @usr, notice: 'Usr was successfully created.' }
        format.json { render json: @usr, status: :created, location: @usr }
      else
        format.html { render action: "new" }
        format.json { render json: @usr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usrs/1
  # PUT /usrs/1.json
  def update
    @usr = Usr.find(params[:id])

    respond_to do |format|
      if @usr.update_attributes(params[:usr])
        format.html { redirect_to @usr, notice: 'Usr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usrs/1
  # DELETE /usrs/1.json
  def destroy
    @usr = Usr.find(params[:id])
    @usr.destroy

    respond_to do |format|
      format.html { redirect_to usrs_url }
      format.json { head :no_content }
    end
  end
end
