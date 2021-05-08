class MeasurmentsController < ApplicationController
  before_action :set_measurment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_use, only: [:edit, :update, :destroy, :show]

  # GET /measurments or /measurments.json
  def index
    @measurments = Measurment.where(:user_id => current_user.id)
  end

  # GET /measurments/1 or /measurments/1.json
  def show
  end                                               

  # GET /measurments/new
  def new
    
    @measurment = current_user.measurments.build
    
  end

  # GET /measurments/1/edit
  def edit
  end

  # POST /measurments or /measurments.json
  def create
    @measurment = Measurment.new(measurment_params)
    @measurment.user = current_user
    respond_to do |format|
      if @measurment.save
        format.html { redirect_to @measurment, notice: "Measurment was successfully created." }
        format.json { render :show, status: :created, location: @measurment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measurment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurments/1 or /measurments/1.json
  def update
    respond_to do |format|
      if @measurment.update(measurment_params)
        format.html { redirect_to @measurment, notice: "Measurment was successfully updated." }
        format.json { render :show, status: :ok, location: @measurment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @measurment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurments/1 or /measurments/1.json
  def destroy
    @measurment.destroy
    respond_to do |format|
      format.html { redirect_to measurments_url, notice: "Measurment was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def correct_use
    @measurment = current_user.measurments.find_by(id: params[:id])
    redirect_to measurments_path, notice: "not Authorised" if @measurment.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurment
      @measurment = Measurment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measurment_params
      params.require(:measurment).permit(:week, :weightKG, :weightStone, :weightPounds, :bodyFat)
    end
end
