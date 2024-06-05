class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :check_admin_user

  def check_admin_user
    unless current_user.is_admin
      flash[:error] = "No tienes acceso"
      redirect_to home_path
    end
  end
end
