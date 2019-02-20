class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
  end

  def all
    @badges = Badge.all
  end
end
