class ApplicationController < ActionController::API
  serialization_scope :current_user
end
