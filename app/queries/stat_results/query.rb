class StatResults::Query
  include Dry::Transaction

  step :stats_scope

  def self.index_query(params={}, &block)
    new.call(params: params, &block)
  end

  def stats_scope(params:)
    stat = StatResult.new(User.count, Event.count, User.last.try(:name), Event.last.try(:title))
    Right(data: StatResultSerializer.new(stat).attributes)
  end
end
