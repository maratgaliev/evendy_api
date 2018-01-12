require 'icalendar'

class Features::CalendarCommand < BaseCommand
  step :generate

  def generate(id:)
    event = Event.find_by(id: id)

    cal = Icalendar::Calendar.new
    cal_event = Icalendar::Event.new
    
    cal_event.dtstart = Icalendar::Values::DateTime.new(event.start_at)
    cal_event.dtend = Icalendar::Values::DateTime.new(event.end_at)
    cal_event.summary = event.title
    cal_event.location = event.address
    cal_event.uid = cal_event.url = "http://evendy.ru/events/#{event.to_param}"
    
    if cal.add_event(cal_event)
      cal.publish
      Right(cal)
    else
      Left(error(I18n.t('errors.base')))
    end
  end
end