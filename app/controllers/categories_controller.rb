class CategoriesController < BaseController

  swagger_controller :categories, 'Categories'

  swagger_api :index do
    summary 'Get all the categories'
    notes 'Should be used for fetching all categories'
    response :unauthorized
    response :ok, "Success"
  end
  swagger_api :create do
    summary 'Creating category'
    notes 'Should be used for creating categories'
    param :form, 'category[title]', :string, :required, 'title'
    param :form, 'category[description]', :text, :required, 'description'
  end
  swagger_api :show do
    summary 'Get category'
    notes 'Should be used for fetching a category'
    param :path, :id, :string, :id
    response :unauthorized
    response :ok, "Success"
  end
  swagger_api :destroy do
    summary 'Destroy category'
    notes 'Should be used for destroying a category'
    param :path, :id, :string, :id
    response :unauthorized
    response :ok, "Success"
  end

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
  