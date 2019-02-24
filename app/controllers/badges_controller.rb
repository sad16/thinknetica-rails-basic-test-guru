class BadgesController < ApplicationController
  def index
    @badges = params[:filter] == 'all' ? Badge.all : current_user.badges
  end
end
