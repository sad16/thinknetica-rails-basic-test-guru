class BadgesController < ApplicationController
  def index
    @badges = (filter == 'all') ? Badge.all : current_user.badges
  end

  private

  def filter
    @filter = params[:filter]
  end
end
