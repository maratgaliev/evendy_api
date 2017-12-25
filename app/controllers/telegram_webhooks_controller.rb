class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  def start(*)
    send_message(['/events - список мероприятий', '/event_info event_id - информация о мероприятии', '/event_users event_id - список участников'].join("\n"))
  end

  def help(*)
    send_message(['/events - список мероприятий', '/event_info event_id - информация о мероприятии', '/event_users event_id - список участников'].join("\n"))
  end

  def events
    send_message(Event.actual.all.map { |event| "<b>[#{event.id}] #{event.title}</b>" }.join("\n"))
  end

  def event_info(event_id = nil)
    unless event_id
      send_message('Укажите через пробел идентификатор события.
Например: /event_info 1
Идентификаторы события выводятся по команде /events')
      else
        event = Event.find_by_id(event_id)
        if event
          message =
"<b>Наименование:</b> #{event.title}
<b>Адрес:</b> #{event.address}
<b>Начало:</b> #{event.start_at.strftime('%d/%m/%Y')} в #{event.end_at.strftime('%H:%M')}
<b>Окончание:</b> #{event.end_at.strftime('%d/%m/%Y')} в #{event.end_at.strftime('%H:%M')}
<b>Места:</b> #{event.max_limit}, занято #{event.going.size}
<b>Ссылка:</b> http://evendy.ru/events/#{event.id}"
          send_message(message)
        else
          send_message('Событие не найдено')
        end
    end
  end

  def event_users(event_id = nil)
    unless event_id
      send_message('Укажите через пробел идентификатор события.
Например: /event_users 1
Идентификаторы события выводятся по команде /events')
    else
      event = Event.find_by_id(event_id)
      if event
        send_message(event.going_visitors.map { |user| "#{user.name}" }.join("\n"))
      else
        send_message('Событие не найдено')
      end
    end
  end

  def chosen_inline_result(result_id, query)
    session[:last_chosen_inline_result] = result_id
  end

  def last_chosen_inline_result
    result_id = session[:last_chosen_inline_result]
    if result_id
      respond_with :message, text: result_id
    else
      respond_with :message, text: 'Результат не задан'
    end
  end

  def message(message)
    respond_with :message, text: message['text']
  end

  def send_message(message, parse_mode = :HTML)
    respond_with :message, text: message, parse_mode: parse_mode
  end

  def action_missing(action, *_args)
    if command?
      respond_with :message, text: 'Команда не найдена'
    else
      respond_with :message, text: 'Функционал пока не доступен'
    end
  end
end