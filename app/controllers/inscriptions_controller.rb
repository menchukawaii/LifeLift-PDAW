class InscriptionsController < ApplicationController
  before_action :set_inscription, only: %i[edit update]
  before_action :authenticate_user!

  # GET /inscriptions/new
  def new
    redirect_to action: :my_acount if current_user.inscription.present?
    @inscription = Inscription.new
  end

  # GET /inscriptions/1/edit
  def edit
  end

  # POST /inscriptions or /inscriptions.json
  def create
    @inscription = current_user.build_inscription(inscription_params)

    respond_to do |format|
      if @inscription.save
        format.html { redirect_to my_account_path, notice: "Inscription was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscriptions/1 or /inscriptions/1.json
  def update
    respond_to do |format|
      if @inscription.update(inscription_params)
        format.html { redirect_to my_account_path, notice: "Inscription was successfully updated." }
        # format.json { render :show, status: :ok, location: @inscription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @inscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_account
    redirect_to action: :new if current_user.inscription.blank?

    @rutines = current_user.rutines
    @weeks = @rutines.distinct.order(week: :desc).pluck(:week) # pluck devuelve solo un campo de la tabla
    redirect_to my_account_path(current_user, week: @weeks.first) if @weeks.present? && params[:week].blank?

    @week = params[:week]
    @rutines_week = @rutines.where(week: @week)
  end

  def view_rutine
    @rutine = current_user.rutines.find(params[:rutine])
  end

  def view_exercise
    @exercise = Exercise.find(params[:exercise])
  end

  def done_rutine_set
    @rutine_set = current_user.rutine_sets.find(params[:set])
    @rutine_set.is_done = true
    @rutine_set.save
    redirect_back(fallback_location: home_path)
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inscription_params
    params.require(:inscription).permit(:goal, :comment, :age, :height, :weight, :weight_goal, :body_fat, :body_fat_goal)
  end
end
