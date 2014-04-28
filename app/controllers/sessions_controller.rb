class SessionsController < ApplicationController

  
  def create
    @current_user = User.authenticate_via_soundcloud auth_hash_params
    session[:user_id] = @current_user.id
    if @current_user
      redirect_to :users, notice: "Welcome back!"

    else
      flash.now[:error] = "Invalid Username / Password!"
      redirect_to [:new, :registration]
    end
  end

  def logout
    @current_user = session[:user_id] = nil
    redirect_to :root, notice: "C ya later!"
  end

  protected

  def auth_hash_params
    request.env['omniauth.auth']
  end

end
