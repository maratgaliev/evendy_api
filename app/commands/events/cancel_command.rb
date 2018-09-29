class Events::CancelCommand < BaseCommand
    step :get
    def get(user:, id:)
      event = Event.find_by(id: id)
      event.state = :cancelled
      event.save
      tg = TelegramService.new(event, user).call(:cancel)
      event ? Right(event) : Left(error(I18n.t('errors.events.not_found')))
    end
  end