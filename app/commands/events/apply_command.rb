class Events::ApplyCommand < BaseCommand
  
  step :check_limit
  step :authorize
  step :call_visit

  def check_limit(id:, user:)
    event = Event.find(id)
    srv = AllocationService.new(event, user)
    (return Right(event: event, user: user)) if srv.user_decision?
    if srv.empty_slots?
      Right(event: event, user: user)
    else
      Left(error(I18n.t('errors.events.reached_limit')))
    end
  end

  def authorize(event:, user:)
    if user.is_banned?
      Left(error(I18n.t('errors.events.user_banned')))
    else
      Right(event: event, user: user)
    end
  end

  def call_visit(event:, user:)
    visit = Visit.where(event: event, user: user).first_or_initialize
    tg = TelegramService.new(event, user)
    if visit.persisted?
      tg.call(:no)
      visit.destroy
    else
      tg.call(:go)
      visit.save
    end
    Right(visit)
  end
end
