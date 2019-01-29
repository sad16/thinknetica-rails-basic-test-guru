class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  before_action :authenticate_user!

  private

  def rescue_with_not_found
    head :not_found
  end
end
