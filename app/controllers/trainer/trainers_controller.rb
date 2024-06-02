class Trainer::TrainersController < Trainer::BaseController
  def my_account
    @q = current_user.my_users.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def user
    @user = current_user.my_users.find params[:user]
  end
end
