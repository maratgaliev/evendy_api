class UsersController < BaseController
  before_action :authenticate_user!, except: [:show]
  def show
    run_command(Users::ShowCommand, id: params[:id])
  end
end
