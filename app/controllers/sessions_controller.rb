class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:return_to_url) || tests_path
    else
      flash.now[:alert] = 'Email or Password invalid'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to login_path, notice: 'Logout was success'
  end
end
