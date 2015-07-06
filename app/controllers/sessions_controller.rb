class SessionsController < ApplicationController
  def new
  end

  def create
  	@auth = request.env['omniauth.auth']
  	user = User.from_omniauth(env['omniauth.auth'])
  	session[:user_id] = user.id
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
