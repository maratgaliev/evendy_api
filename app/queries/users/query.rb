class Users::Query
  include Dry::Transaction
  step :users_scope
  step :rating

  def self.index_query(params={}, &block)
    new.call(params: params, &block)
  end

  def users_scope(params:)
    Right(users: User, params: params)
  end

  def rating(users:, params:)
    Right(users.rated.limit(20))
  end
end
  