class Events::CreateCommand < BaseCommand
  step :validate
  step :persist
  def validate(user:, params:)
    form = Events::Form.call(params)

    if form.success?
      Right(user: user, params: form.to_h)
    else
      Left(form.errors)
    end
  end

  def persist(user:, params:)
    event = Event.new(params)
    event.author_id = user.id
    if event.save
      Right(event)
    else
      Left(error(I18n.t('errors.base')))
    end
  end
end