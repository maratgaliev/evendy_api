Events::Form = Dry::Validation.Form do
  required(:title).filled(:str?)
  required(:address).filled(:str?)
  required(:description).filled(:str?)
  required(:start_at).filled(:str?)
  required(:end_at).filled(:str?)
  required(:max_limit).filled(:int?)
end
