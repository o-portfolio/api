class UsersController < ApplicationController
  
  skip_before_filter :check_authentication, only: [:create]
  
  def show
    unless params[:id].to_i == @current_user.id
      head :forbidden
      return false
    end
    
    render json: user_to_json(@current_user)
  end
  
  def create
    user = User.new(params.slice(:first_name, :last_name, :email, :password))
    if user.save
      render json: user_to_json(user), status: 200
    else
      render json: {errors: user.errors}, status: 422
    end
  end
  
  def update
    if @current_user.update_attributes(params.slice(:first_name, :last_name, :email, :password))
      render json: user_to_json(@current_user), status: 200
    else
      render json: {errors: @current_user.errors}, status: 422
    end
    
  end
  
  def authenticate
    render json: user_to_json(@current_user)
  end
  
  protected
  
    def user_to_json(user)
      user.to_json(only:[:id, :first_name, :last_name, :email])
    end
  
end
