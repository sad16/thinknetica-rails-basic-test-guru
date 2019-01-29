module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_messages(flash)
    flash.map { |type, message| content_tag :p, message, class: "flash #{type}" }.join.html_safe
  end
end
