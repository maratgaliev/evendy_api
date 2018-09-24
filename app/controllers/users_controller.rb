class UsersController < BaseController
  before_action :authenticate_user!, except: [:show, :index]
  def show
    run_command(Users::ShowCommand, id: params[:id])
  end

  def index
    Users::Query.index_query(params) do |q|
      q.success {|users| api_response(users) }
      q.failure { api_response([]) }
    end
  end
end
