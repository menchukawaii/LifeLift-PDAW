class Trainer::RutineSetsController < Trainer::BaseController

  def create
    @rutine = current_user.trainer_rutines.find params[:rutine_set][:rutine_id]
    @rutine_set = @rutine.rutine_sets.new(rutine_set_params)
    respond_to do |format|
      if @rutine.save
        format.html do
          # flash[:notice] = ""
          redirect_back(fallback_location: home_path)
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rutine = current_user.trainer_rutines.find params[:rutine_id]
    @rutine_set = @rutine.rutine_sets.find params[:rutine_set_id]

    @rutine_set.destroy!

    respond_to do |format|
      format.html do
        flash[:notice] = "Set was successfully destroyed."
        redirect_back(fallback_location: home_path)
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def rutine_set_params
    params.require(:rutine_set).permit(:reps, :weight, :exercise_id)
  end
end
