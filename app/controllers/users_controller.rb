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
    user = User.create(params.slice(:first_name, :last_name, :email, :password, :password_confirmation))
    render json: user_to_json(user)
  end
  
  def update
    @current_user.update_attributes(params.slice(:first_name, :last_name, :email, :password, :password_confirmation))
    render json: user_to_json(@current_user)
  end
  
  def authenticate
    render json: true
  end
  
  protected
  
    def user_to_json(user)
      user.to_json(only:[:id, :first_name, :last_name, :email])
    end
  
end
