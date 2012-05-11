class MrksController < ApplicationController
  # I want to use i_own?(object) in ApplicationHelper:
  include ApplicationHelper

  # GET /mrks
  def index
    @mrks = Mrk.order("created_at DESC")
  end

  # GET /mrks/1
  def show
    @mrk = Mrk.find(params[:id])
  end

  # GET /mrks/new
  def new
    @mrk = Mrk.new
  end

  # GET /mrks/1/edit
  def edit
    @mrk = Mrk.find(params[:id])
  end

  # POST /mrks
  def create
    @mrk = Mrk.new(params[:mrk])
    case
    when current_user.present?
      @mrk.user_id = current_user.id
    else
      @usr = Usr.find_by_name session[:usr]
      @mrk.usr_id = @usr.id unless @usr.blank?
    end

    respond_to do |format|
      if @mrk.save
        format.html { redirect_to @mrk, notice: 'Mrk was successfully created.' }
      else
        format.html { render action: "new", notice: '@mrk.save failed. It is not your fault. Good Luck.' }
      end
    end
  end

  # PUT /mrks/1
  def update
    @mrk = Mrk.find(params[:id])

    respond_to do |format|
      if @mrk.update_attributes(params[:mrk])
        format.html { redirect_to @mrk, notice: 'Mrk was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /mrks/1
  def destroy
    @mrk = Mrk.find(params[:id])
    if i_own?(@mrk)
      @mrk.destroy 
      flash[:notice] = 'You deleted a Bookmark'
    else
      flash[:notice] = 'You tried to delete a Bookmark but it still exists.  It is not your fault.'
    end
    redirect_to mrks_url
  end
end
