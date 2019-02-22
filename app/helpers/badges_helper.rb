module BadgesHelper
  IMAGES = [
    [I18n.t('badges.helpers.images.cat'), '/images/cat.svg'],
    [I18n.t('badges.helpers.images.diamond'), '/images/diamond.svg'],
    [I18n.t('badges.helpers.images.thumb'), '/images/thumb.svg']
  ].freeze

  RULES = [
    [I18n.t('badges.helpers.rules.category'), :category],
    [I18n.t('badges.helpers.rules.level'), :level],
    [I18n.t('badges.helpers.rules.attempt'), :attempt]
  ].freeze

  def badge_image_url_options
    IMAGES
  end

  def badge_rule_name_options
    RULES
  end
end
