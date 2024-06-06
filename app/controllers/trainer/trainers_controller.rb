class Trainer::TrainersController < Trainer::BaseController
  def my_account
    @q = current_user.my_users.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def user
    @user = current_user.my_users.find params[:user]
    @weeks = @user.rutines.distinct.order(week: :desc).pluck(:week) # pluck devuelve solo un campo de la tabla
    redirect_to trainer_user_path(@user, week: @weeks.first) if @weeks.present? && params[:week].blank?

    @week = params[:week]
    @rutines = @user.rutines.where(week: @week)
  end
end
