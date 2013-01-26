class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_authentication
  
  protected
  
    def check_authentication
      authenticate_or_request_with_http_basic do |username, password|
        @current_user = User.authenticate(username, password)
      end
    end
end