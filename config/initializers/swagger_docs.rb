
# class Swagger::Docs::Config
#   def self.base_api_controller
#     BaseController
#   end

#   def self.transform_path(path, api_version)
#     "apidocs/#{path}"
#   end
# end


include Swagger::Docs::ImpotentMethods

#Swagger::Docs::Config.register_apis({})

class Swagger::Docs::Config
  def self.base_api_controller
    BaseController
  end
end

Swagger::Docs::Config.register_apis({
  "1.0": {
    api_extension_type: :json,
    api_file_path: 'public/apidocs',
    base_path: "http://api.evendy.ru",
    clean_directory: true,
    attributes: {
      info: {
        "title": "Evendy.ru API docs",
        "description": "Evendy - web service to organize your events.",
        "contact": "kazanlug@gmail.com",
        "license": "MIT"
      }
    }
  }
})