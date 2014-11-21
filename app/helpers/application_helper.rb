module ApplicationHelper
  def nl2br(str)
    if str.present?
      str = html_escape(str)
      str.gsub(/\r\n|\r|\n/, "<br>").html_safe
    end
  end

  def full_title(title)
    if title.blank?
      return Settings.site_information.title
    end

    return "#{title} | #{Settings.site_information.title}"
  end
end
