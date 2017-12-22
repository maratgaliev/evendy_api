NewsItems::Form = Dry::Validation.Form do
  required(:title).filled(:str?)
  required(:description).filled(:str?)
end
