class EventsController < BaseController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :go]
  def index
    Events::Query.index_query(params) do |q|
      q.success {|events| api_response(events) }
      q.failure { api_response([]) }
    end
  end

  def show
    run_command(Events::ShowCommand, id: params[:id])
  end

  def create
    run_command(Events::CreateCommand, user: current_user, params: event_params)
  end
  
  def update
    run_command(
      Events::UpdateCommand,
      id: params[:id],
      params: event_params
    )
  end

  def destroy
    Events::DestroyCommand.run(id: params[:id]) do |m|
      m.success { head :ok }
      m.failure {|errors| error_response(errors) }
    end
  end

  def apply
    run_command(Events::ApplyCommand, id: params[:id], user: current_user)
  end

  private
  
  def event_params
    params.require(:event).permit([:title, :description, :address, :start_at, :end_at, :max_limit, :category_id, :price, :telegram])
  end
end