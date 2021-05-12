# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postcode])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address_city])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:self_introduction])

    devise_parameter_sanitizer.permit(:account_update, keys: [:postcode])
    devise_parameter_sanitizer.permit(:account_update, keys: [:address_city])
    devise_parameter_sanitizer.permit(:account_update, keys: [:self_introduction])
  end
end
