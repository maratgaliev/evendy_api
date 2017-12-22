class BaseController < ApplicationController
  private

  def api_response(data)
    render json: data
  end

  def error_response(errors)
    render json: {errors: errors}, status: :unprocessable_entity
  end

  def run_command(command, params)
    command.run(params) do |m|
      m.success {|object| api_response(object) }
      m.failure {|errors| error_response(errors) }
    end
  end
end
  