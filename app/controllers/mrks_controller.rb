class MrksController < ApplicationController
  # GET /mrks
  # GET /mrks.json
  def index
    @mrks = Mrk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mrks }
    end
  end

  # GET /mrks/1
  # GET /mrks/1.json
  def show
    @mrk = Mrk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mrk }
    end
  end

  # GET /mrks/new
  # GET /mrks/new.json
  def new
    @mrk = Mrk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mrk }
    end
  end

  # GET /mrks/1/edit
  def edit
    @mrk = Mrk.find(params[:id])
  end

  # POST /mrks
  # POST /mrks.json
  def create
    @mrk = Mrk.new(params[:mrk])

    respond_to do |format|
      if @mrk.save
        format.html { redirect_to @mrk, notice: 'Mrk was successfully created.' }
        format.json { render json: @mrk, status: :created, location: @mrk }
      else
        format.html { render action: "new" }
        format.json { render json: @mrk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mrks/1
  # PUT /mrks/1.json
  def update
    @mrk = Mrk.find(params[:id])

    respond_to do |format|
      if @mrk.update_attributes(params[:mrk])
        format.html { redirect_to @mrk, notice: 'Mrk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mrk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mrks/1
  # DELETE /mrks/1.json
  def destroy
    @mrk = Mrk.find(params[:id])
    @mrk.destroy

    respond_to do |format|
      format.html { redirect_to mrks_url }
      format.json { head :no_content }
    end
  end
end
