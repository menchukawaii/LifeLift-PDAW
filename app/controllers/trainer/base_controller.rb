class Trainer::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_trainer_user

  def check_trainer_user
    unless current_user.is_trainer
      flash[:error] = "No tienes acceso"
      redirect_to home_path
    end
  end
end
