class Events::Query
  include Dry::Transaction
  PER_PAGE = 10
  step :events_scope
  step :paginate

  def self.index_query(params={}, &block)
    new.call(params: params, &block)
  end

  def events_scope(params:)
    Right(events: Event.includes(:author).includes(:visits), params: params)
  end

  def paginate(events:, params:)
    Right(events.ordered.paginate(page: params[:page], per_page: PER_PAGE))
  end
end

  