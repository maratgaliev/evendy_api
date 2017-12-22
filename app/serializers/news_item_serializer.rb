class NewsItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date_string

  def news_item
    NewsItemDecorator.decorate(object)
  end

  def date_string
    news_item.date_string
  end
end
