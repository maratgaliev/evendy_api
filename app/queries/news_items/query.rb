class NewsItems::Query
  include Dry::Transaction
    
  PER_PAGE = 100

  step :news_items_scope
  step :paginate

  def self.index_query(params={}, &block)
    new.call(params: params, &block)
  end

  def news_items_scope(params:)
    Right(news_items: NewsItem, params: params)
  end

  def paginate(news_items:, params:)
    Right(news_items.ordered.paginate(page: params[:page], per_page: PER_PAGE))
  end
end
