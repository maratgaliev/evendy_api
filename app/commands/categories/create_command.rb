class Categories::CreateCommand < BaseCommand
  step :validate
  step :persist

  def validate(params:)
    form = Categories::Form.call(params)

    if form.success?
      Right(params: form.to_h)
    else
      Left(form.errors)
    end
  end

  def persist(params:)
    category = Category.new(params)
    if category.save
      Right(category)
    else
      Left(error(I18n.t('errors.base')))
    end
  end
end