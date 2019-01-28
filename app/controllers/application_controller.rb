class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  before_action :authenticate_user!

  helper_method :current_user, :logged_in?

  private

  def rescue_with_not_found
    head :not_found
  end

  def authenticate_user!
    unless current_user
      cookies[:return_to_url] = request.url
      redirect_to login_path, alert: 'Not authenticate'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
