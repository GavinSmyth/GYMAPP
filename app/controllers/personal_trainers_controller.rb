require './app/policies/personal_trainer_policy'
class PersonalTrainersController < ApplicationController
  before_action :set_personal_trainer, only: %i[ show edit update destroy ]
  before_action :auth_user, :except => [:show, :index]
  

  # GET /personal_trainers or /personal_trainers.json
  def index
    @personal_trainers = PersonalTrainer.all
  end

  # GET /personal_trainers/1 or /personal_trainers/1.json
  def show
  end

  # GET /personal_trainers/new
  def new
    
    @personal_trainer = PersonalTrainer.new

  end
  def auth_user
      return if current_user.admin == true

          redirect_to personal_trainers_path, notice: "Must be admin"
     end

  # GET /personal_trainers/1/edit
  def edit
  end

  # POST /personal_trainers or /personal_trainers.json
  def create
    @personal_trainer = PersonalTrainer.new(personal_trainer_params)
    authorize @personal_trainer
    respond_to do |format|
      if @personal_trainer.save
        format.html { redirect_to @personal_trainer, notice: "Personal trainer was successfully created." }
        format.json { render :show, status: :created, location: @personal_trainer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_trainers/1 or /personal_trainers/1.json
  def update
    authorize @personal_trainer
    respond_to do |format|
      if @personal_trainer.update(personal_trainer_params)
        format.html { redirect_to @personal_trainer, notice: "Personal trainer was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_trainer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_trainers/1 or /personal_trainers/1.json
  def destroy
    authorize @personal_trainer
    @personal_trainer.destroy
    respond_to do |format|
      format.html { redirect_to personal_trainers_url, notice: "Personal trainer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_trainer
      @personal_trainer = PersonalTrainer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personal_trainer_params
      params.require(:personal_trainer).permit(:name, :email, :number, :description, :noOfClient)
    end
end
