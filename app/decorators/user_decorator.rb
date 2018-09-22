class UserDecorator < ApplicationDecorator
  delegate_all

  def date_string
    "#{I18n.l(object.created_at, format: '%A')}, #{I18n.l(object.created_at, format: '%d %B')} #{object.created_at.strftime('%Y')}"
  end
end
