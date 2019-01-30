class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user.admin?
  end
end
