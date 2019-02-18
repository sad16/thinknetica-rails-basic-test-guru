class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: [:show, :edit, :update, :destroy]
  before_action :load_config, only: [:new, :edit]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = current_user.badges.new
  end

  def edit
  end

  def create
    @badge = current_user.badges.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image_url, :rule_name, :rule_value)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def load_config
    @config ||= Rails.application.config_for(:badges).deep_symbolize_keys
  end
end
