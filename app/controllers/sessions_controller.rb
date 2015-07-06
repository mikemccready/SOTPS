class SessionsController < ApplicationController
  def new
  end

  def create
  	@auth = request.env['omniauth.auth']
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
