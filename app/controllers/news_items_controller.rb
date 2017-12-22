class NewsItemsController < BaseController

  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def index
    NewsItems::Query.index_query(params) do |q|
      q.success {|news_items| api_response(news_items) }
      q.failure { api_response([]) }
    end
  end

  def show
    run_command(NewsItems::ShowCommand, id: params[:id])
  end

  def create
    run_command(NewsItems::CreateCommand, user: current_user, params: news_item_params)
  end
  
  def update
    run_command(
      NewsItems::UpdateCommand,
      id: params[:id],
      user: current_user,
      params: news_item_params
    )
  end

  def destroy
    NewsItems::DestroyCommand.run(id: params[:id], user: current_user) do |m|
      m.success { head :ok }
      m.failure {|errors| error_response(errors) }
    end
  end

  private
  
  def news_item_params
    params.require(:news_item).permit([:title, :description])
  end
end
