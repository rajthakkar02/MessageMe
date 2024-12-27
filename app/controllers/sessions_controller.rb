class SessionsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      flash[:success] = "You have successfully logged in."
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username or password. Please try again."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out."
    redirect_to login_path
  end

  private

  def require_user_logged_in
    if logged_in?
      flash[:error] = "You are already logged in."
      redirect_to root_path
    end
  end
end
