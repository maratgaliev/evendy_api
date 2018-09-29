class EventsController < BaseController
  
  swagger_controller :events, 'Events'

  swagger_api :index do
    summary 'Get all the events'
    notes 'Should be used for fetching all events'
    response :unauthorized
    response :ok, "Success"
  end
  swagger_api :create do
    summary 'Creating event'
    notes 'Should be used for creating events'
    param :form, 'event[title]', :string, :required, 'title'
    param :form, 'event[description]', :text, :required, 'description'
  end
  swagger_api :show do
    summary 'Get event'
    notes 'Should be used for fetching a event'
    param :path, :id, :string, :id
    response :unauthorized
    response :ok, "Success"
  end
  swagger_api :destroy do
    summary 'Destroy event'
    notes 'Should be used for destroying a event'
    param :path, :id, :string, :id
    response :unauthorized
    response :ok, "Success"
  end

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

  def cancel
    run_command(Events::CancelCommand, user: current_user, id: params[:id])
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