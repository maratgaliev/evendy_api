class FeaturesController < BaseController
  def calendar
    cal = run_command(Features::CalendarCommand, {id: params[:id]})
    headers['Content-Type'] = 'text/calendar; charset=UTF-8'
  end

  private

  def run_command(command, params)
    command.run(params) do |m|
      m.success {|object| calendar_response(object) }
      m.failure {|errors| error_response(errors) }
    end
  end
end