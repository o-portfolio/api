class UsersController < ApplicationController
  
  skip_before_filter :check_authentication, only: [:create]
  
  def show
    unless params[:id].to_i == @current_user.id
      head :forbidden
      return false
    end
    
    render json: @current_user.to_json(only:[:id, :first_name, :last_name, :email])
  end
  
  def create
    render json: User.create(params.slice(:first_name, :last_name, :email, :password, :password_confirmation))
  end
  
  def update
  end
  
  def authenticate
    render json: true
  end
  
end
