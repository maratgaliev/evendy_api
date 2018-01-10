class BaseController < ApplicationController
  include Swagger::Docs::ImpotentMethods
  class << self
    Swagger::Docs::Generator::set_real_methods

    def inherited(subclass)
      super
      subclass.class_eval do
        setup_basic_api_documentation
      end
    end

    private
    def setup_basic_api_documentation
      [:index, :show, :create, :update, :delete].each do |api_action|
        swagger_api api_action do
          param :header, 'Authorization', :string, :required, 'Authentication token'
        end
      end
    end
  end
  
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
  