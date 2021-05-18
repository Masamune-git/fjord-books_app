# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postcode, :address_city, :self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:postcode, :address_city, :self_introduction])
  end
end

def after_sign_up_path_for(_resource_or_scope)
  books_path
end
