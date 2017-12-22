class Categories::UpdateCommand < BaseCommand
  step :validate
  step :update

  def validate(category:, params:)
    form = Categories::Form.call(params)

    if form.success?
      Right(category: category, params: form.to_h)
    else
      Left(form.errors)
    end
  end

  def update(category:, params:)
    category.assign_attributes(params)

    if category.save
      Right(category)
    else
      Left(error(I18n.t('errors.base')))
    end
  end
end