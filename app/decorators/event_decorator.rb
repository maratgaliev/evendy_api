class EventDecorator < ApplicationDecorator
  delegate_all

  def date_string
    "#{I18n.l(object.start_at, format: '%a')}, #{I18n.l(object.start_at, format: '%b %d')} в #{object.start_at.strftime('%H:%M')}"
  end

  def rfc(method)
    object.send(method).try(:rfc2822)
  end

  def format_price
    object.price&.to_i
  end

  def slug
    object.to_param
  end
end
