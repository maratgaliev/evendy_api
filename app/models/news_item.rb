class NewsItem < ApplicationRecord
  belongs_to :user
  scope :ordered, -> { order(updated_at: :desc) }
end
