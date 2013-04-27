class EntriesController < ApplicationController
  
  def index
    @entries = @current_user.entries
    render json: @entries
  end
  
  def show
    @entry = @current_user.entries.find(params[:id])
    render json: @entry
  end
  
  def create
    @entry = @current_user.entries.build(params.slice(:title, :description, :reflection, :occurred_at, :image, :image_latitude, :image_longitude))
    if @entry.save
      render json: @entry, status: 200
    else
       render json: {errors: @entry.errors}, status: 422
    end
  end
  
  def update
    @entry = @current_user.entries.find(params[:id])
    if @entry.update_attributes(params.slice(:title, :description, :reflection, :occurred_at))
      render json: @entry, status: 200
    else
      render json: {errors: @entry.errors}, status: 422
    end
  end
  
  def destroy
    @entry = @current_user.entries.find(params[:id])
    @entry.destroy
  end

end
