class Categories::ShowCommand < BaseCommand
  step :get

  def get(id:)
    category = Category.find_by(id: id)
    category ? Right(category) : Left(error(I18n.t('errors.categories.not_found')))
  end
end

