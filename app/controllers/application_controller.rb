class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  private

  def rescue_with_not_found
    head :not_found
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
  end
end
