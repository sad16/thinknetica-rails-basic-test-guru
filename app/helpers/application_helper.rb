module ApplicationHelper
  ALERT_TYPES = {
    default: 'primary',
    notice: 'success',
    alert: 'danger'
  }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def alert_class(type)
    ALERT_TYPES[type.to_sym] || ALERT_TYPES[:default]
  end

  def active_link_to(text, path, classes)
    classes += 'active' if current_page?(path)
    link_to text, path, class: classes
  end
end
