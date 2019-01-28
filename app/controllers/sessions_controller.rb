class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to return_to_url
    else
      flash.now[:alert] = 'Email or Password invalid'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to login_path, notice: 'Logout was success'
  end

  private

  def return_to_url
    url = cookies[:return_to_url] || tests_path
    cookies.delete(:return_to_url)
    url
  end
end
