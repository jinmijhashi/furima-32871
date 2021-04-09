class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  protected
 
  def configure_permitted_parameters
    binding.pry
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :email, :birth_date, :first_name, :last_name, :first_name_kana, :last_name_kana]
    )
  end


 
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '1234'
    end
  end
end
  

