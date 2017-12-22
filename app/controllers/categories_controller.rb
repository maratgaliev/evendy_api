class CategoriesController < BaseController

  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    Categories::Query.index_query(params) do |q|
      q.success {|categories| api_response(categories) }
      q.failure { api_response([]) }
    end
  end

  def show
    run_command(Categories::ShowCommand, id: params[:id])
  end

  def create
    run_command(Categories::CreateCommand, params: category_params)
  end
  
  def update
    run_command(
      Categories::UpdateCommand,
      id: params[:id],
      user: current_user,
      params: category_params
    )
  end

  def destroy
    Categories::DestroyCommand.run(id: params[:id], user: current_user) do |m|
      m.success { head :ok }
      m.failure {|errors| error_response(errors) }
    end
  end

  private
  
  def category_params
    params.require(:category).permit([:title, :description])
  end

end
  