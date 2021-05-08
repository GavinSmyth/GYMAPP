require './app/policies/gym_class_policy'
class GymClassesController < ApplicationController
  before_action :set_gym_class, only: %i[ show edit update destroy ]
  before_action :auth_user, :except => [:show, :index]

  # GET /gym_classes or /gym_classes.json
  def index
    @gym_classes = GymClass.all
  end

  # GET /gym_classes/1 or /gym_classes/1.json
  def show
  end

  # GET /gym_classes/new
  def new
    @gym_class = GymClass.new
  end
  def auth_user
      return if current_user.admin == true

          redirect_to personal_trainers_path, notice: "Must be admin"
     end

  # GET /gym_classes/1/edit
  def edit
  end

  # POST /gym_classes or /gym_classes.json
  def create
    
    @gym_class = GymClass.new(gym_class_params)
    authorize @gym_class

    respond_to do |format|
      if @gym_class.save
        format.html { redirect_to @gym_class, notice: "Gym class was successfully created." }
        format.json { render :show, status: :created, location: @gym_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gym_class.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /gym_classes/1 or /gym_classes/1.json
  def update
    authorize @gym_class
    respond_to do |format|
      if @gym_class.update(gym_class_params)
        format.html { redirect_to @gym_class, notice: "Gym class was successfully updated." }
        format.json { render :show, status: :ok, location: @gym_class }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gym_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gym_classes/1 or /gym_classes/1.json
  def destroy
    authorize @gym_class
    @gym_class.destroy
    respond_to do |format|
      format.html { redirect_to gym_classes_url, notice: "Gym class was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gym_class
      @gym_class = GymClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gym_class_params
      params.require(:gym_class).permit(:PT_id, :PT_name, :Class_type, :Date, :Time)
    end
end
