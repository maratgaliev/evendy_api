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

class NewsItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date_string

  def news_item
    NewsItemDecorator.decorate(object)
  end

  def date_string
    news_item.date_string
  end
end
