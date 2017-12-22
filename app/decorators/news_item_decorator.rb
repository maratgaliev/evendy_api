class NewsItemDecorator < ApplicationDecorator
  delegate_all

  def date_string
    "#{I18n.l(object.created_at, format: '%a')}, #{I18n.l(object.created_at, format: '%b %d')}"
  end
end
