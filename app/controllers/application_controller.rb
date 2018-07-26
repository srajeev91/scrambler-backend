class ApplicationController < ActionController::API
  private

  def secret_key
    # 'secret key'
    # byebug
    ENV['SECRET_KEY']
  end


  def authorization_token
   request.headers["Authorization"]
  end

 def decoded_token
   begin
     JWT.decode authorization_token(), secret_key(), true, { algorithm: 'HS256' }
   rescue
     nil
   end
 end

 def valid_token?
   !!decoded_token
 end

 def requires_login
   if !valid_token?
     render json: {
       message: 'Wrong username or password. Please try again'
     }, status: :unauthorized
   end
 end

 def is_admin
   decoded_token[0]["id"] == 1
 end

 def payload(name, id)
   { name: name, id: id }
 end

 def get_token(payload)
   JWT.encode payload, secret_key(), 'HS256'
 end
end
