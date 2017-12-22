class Category < ApplicationRecord
  scope :ordered, -> { order(updated_at: :desc) }
end
