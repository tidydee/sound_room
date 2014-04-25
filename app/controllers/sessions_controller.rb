require 'pry'
class SessionsController < ApplicationController

  def create
    # binding.pry
    @current_user = User.authenticate_via_soundcloud auth_hash_params
    session[:user_id] = @current_user.id
    if @current_user
      redirect_to :root
      
    else
      redirect_to [:new, :registration]
    end
  end

  protected

  def auth_hash_params
    request.env['omniauth.auth']
  end

end
