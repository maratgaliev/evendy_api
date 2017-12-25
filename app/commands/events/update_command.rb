class Events::UpdateCommand < BaseCommand
  
  step :find
  step :validate
  step :update

  def find(id:, params:)
    event = Event.find_by(id: id)

    if event
      Right(event: event, params: params)
    else
      Left(error(I18n.t('errors.events.not_found')))
    end    
  end

  def validate(event:, params:)
    form = Events::Form.call(params)

    if form.success?
      Right(event: event, params: form.to_h)
    else
      Left(form.errors)
    end
  end

  def update(event:, params:)
    event.assign_attributes(params)

    if event.save
      Right(event)
    else
      Left(error(I18n.t('errors.base')))
    end
  end
end