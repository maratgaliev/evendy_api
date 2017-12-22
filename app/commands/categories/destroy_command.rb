class Categories::DestroyCommand < BaseCommand
  step :destroy

  def destroy(category)
    category.delete
    Right(:deleted)
  end
end