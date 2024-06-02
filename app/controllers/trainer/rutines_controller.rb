class Trainer::RutinesController < Trainer::BaseController
  before_action :set_rutine, only: %i[edit update destroy]

  # GET /rutines/new
  def new
    @user = current_user.my_users.find params[:user]
    @rutine = @user.rutines.new
  end

  # GET /rutines/1/edit
  def edit
    @rutine_set = @rutine.rutine_sets.new
  end

  # POST /rutines or /rutines.json
  def create
    @user = current_user.my_users.find params[:rutine][:user_id]
    @rutine = @user.rutines.new(rutine_params)
    @rutine.trainer = current_user
    respond_to do |format|
      if @rutine.save
        format.html { redirect_to trainer_user_path(@user), notice: "Rutine was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rutines/1 or /rutines/1.json
  def update
    respond_to do |format|
      if @rutine.update(rutine_params)
        format.html { redirect_to trainer_user_path(@rutine.user), notice: "Rutine was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rutines/1 or /rutines/1.json
  def destroy
    @rutine.destroy!

    respond_to do |format|
      format.html do
        flash[:notice] = "Rutine was successfully destroyed."
        redirect_back(fallback_location: home_path)
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rutine
    @rutine = current_user.trainer_rutines.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rutine_params
    params.require(:rutine).permit(:name, :day, :week, :nutrition)
  end
end
