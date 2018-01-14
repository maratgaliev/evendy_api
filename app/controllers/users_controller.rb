class UsersController < BaseController
  before_action :authenticate_user!
  def show
    run_command(Users::ShowCommand, id: params[:id])
  end
end
