class EntriesController < ApplicationController
  
  def index
  end
  
  def show
    @entry = @current_user.entries.find(params[:id])
    render json: @entry
  end
  
  def create
    @entry = @current_user.entries.create(params.slice(:title, :description, :reflection))
    render json: @entry
  end
  
  def update
    @entry = @current_user.entries.find(params[:id])
    @entry.update_attributes(params.slice(:title, :description, :reflection))
    render json: user_to_json(@current_user)
  end
  
  def destroy
    @entry = @current_user.entries.find(params[:id])
    @entry.destroy
  end
end
