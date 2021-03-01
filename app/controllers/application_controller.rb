class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_parmitted_parameters, if: :devise_controller?

  private

  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :first_name, :last_name, :first_name_read, :last_name_read, :birth_day])
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
