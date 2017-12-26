class TelegramService
  def initialize(event, user)
    @event = event
    @user = user
  end

  def call(method)
    if @event.telegram.present?
      send_to_telegram(go_text(:go)) if method == :go
      send_to_telegram(go_text(:no)) if method == :no
      send_to_telegram(new_text) if method == :new
    end
  end

  def go_text(choice)
    I18n.t("users.decision_text_#{choice}", event_date: @event.start_at.strftime('%d/%m/%Y'), event_title: @event.title, event_user: @user.name)
  end

  def new_text
    I18n.t("users.new_event", event_date: @event.start_at.strftime('%d/%m/%Y'), event_hours: @event.start_at.strftime('%H:%M'), event_title: @event.title, event_user: @event.author.name)
  end

  def send_to_telegram(text)
    begin
      bot = Telegram::Bot::Client.new(TELEGRAM_API_KEY)
      bot.send_message(chat_id: "@#{@event.telegram}", text: text)
    rescue Exception
      Rails.logger.info("TELEGRAM CHAT NOT_FOUND: #{@event.telegram}")
    end
  end
end