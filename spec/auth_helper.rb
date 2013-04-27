module AuthHelper
  def http_login
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("email", "password")
  end  
end

 
module AuthRequestHelper
  def http_login
    @env ||= {}
    @env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("email","password")
    User.where(email: "email").first || create(:auth_user)
  end
end
