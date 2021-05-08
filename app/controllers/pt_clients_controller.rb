class PtClientsController < ApplicationController
  before_action :set_pt_client, only: %i[ show edit update destroy ]

  # GET /pt_clients or /pt_clients.json
  def index
    @pt_clients = PtClient.all
  end

  # GET /pt_clients/1 or /pt_clients/1.json
  def show
  end

  # GET /pt_clients/new
  def new
    @pt_client = PtClient.new
  end

  # GET /pt_clients/1/edit
  def edit
  end

  # POST /pt_clients or /pt_clients.json
  def create
    @pt_client = PtClient.new(pt_client_params)

    respond_to do |format|
      if @pt_client.save
        format.html { redirect_to @pt_client, notice: "Pt client was successfully created." }
        format.json { render :show, status: :created, location: @pt_client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pt_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pt_clients/1 or /pt_clients/1.json
  def update
    respond_to do |format|
      if @pt_client.update(pt_client_params)
        format.html { redirect_to @pt_client, notice: "Pt client was successfully updated." }
        format.json { render :show, status: :ok, location: @pt_client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pt_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pt_clients/1 or /pt_clients/1.json
  def destroy
    @pt_client.destroy
    respond_to do |format|
      format.html { redirect_to pt_clients_url, notice: "Pt client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pt_client
      @pt_client = PtClient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pt_client_params
      params.require(:pt_client).permit(:name, :age, :email, :number)
    end
end
