class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :authenticate_user!

  def default_url_options
    lang = I18n.locale != I18n.default_locale ? I18n.locale : nil
    { lang: lang }
  end

  private

  def rescue_with_not_found
    head :not_found
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
  end

  def set_locale
    lang = params[:lang]
    I18n.locale = I18n.locale_available?(lang) ? lang : I18n.default_locale
  end
end
