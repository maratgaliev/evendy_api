# == Schema Information
#
# Table name: news_items
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class NewsItem < ApplicationRecord
  belongs_to :user
  scope :ordered, -> { order(updated_at: :desc) }
end
