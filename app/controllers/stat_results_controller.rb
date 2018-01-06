class StatResultsController < BaseController
  def index
    StatResults::Query.index_query(params) do |q|
      q.success {|stat_results| api_response(stat_results) }
      q.failure { api_response([]) }
    end
  end
end
