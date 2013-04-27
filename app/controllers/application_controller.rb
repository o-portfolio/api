class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Basic::ControllerMethods
  #include ActionController::HttpAuthentication::Basic

  before_filter :check_authentication
  
  protected
  
    def check_authentication
      authenticate_or_request_with_http_basic do |username, password|
        @current_user = User.authenticate(username, password)
      end
    end
end
