class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # reescribe devise para redireccionar despues de login
  # resource equivale a current_user
  def after_sign_in_path_for(resource)
    if resource.is_trainer
      trainer_my_account_path
    else
      my_account_path
    end
  end

  def after_sign_up_path_for(resource)
    new_inscription_path
  end

  def after_log_out_path_for(resource)
    home_path
  end
end
