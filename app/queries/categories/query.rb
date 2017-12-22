class Categories::Query
  include Dry::Transaction
  PER_PAGE = 10
  step :categories_scope
  step :paginate

  def self.index_query(params={}, &block)
    new.call(params: params, &block)
  end

  def categories_scope(params:)
    Right(categories: Category, params: params)
  end

  def paginate(categories:, params:)
    Right(categories.ordered.paginate(page: params[:page], per_page: PER_PAGE))
  end
end
  