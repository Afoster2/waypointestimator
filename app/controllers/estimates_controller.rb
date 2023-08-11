class EstimatesController < ApplicationController
  before_action :set_estimate, only: %i[ show edit update destroy ]

  # GET /estimates or /estimates.json
  def index
    @estimates = Estimate.all
  end

  # GET /estimates/1 or /estimates/1.json
  def show
  end

  # GET /estimates/new
  def new
    @estimate = Estimate.new
    @boat_model = BoatModel.first
  end

  # GET /estimates/1/edit
  def edit
    @estimate = Estimate.find(params[:id])
    @boat_model = @estimate.boat_model
  end

  # POST /estimates or /estimates.json
  def create
    @estimate = Estimate.new(estimate_params)

    if @estimate.save
      redirect_to @estimate, notice: "Estimate was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /estimates/1 or /estimates/1.json
  def update
    respond_to do |format|
      if @estimate.update(estimate_params)
        format.html { redirect_to estimate_url(@estimate), notice: "Estimate was successfully updated." }
        format.json { render :show, status: :ok, location: @estimate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimates/1 or /estimates/1.json
  def destroy
    @estimate.destroy

    respond_to do |format|
      format.html { redirect_to estimates_url, notice: "Estimate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estimate_params
      params.require(:estimate).permit(:customer_id, :boat_model_id, :subtotal, :tax, :vit, :doc_fee, :registration, :total_price,
        power_option_ids: [], console_option_ids: [], factory_option_ids: [], gauge_upgrade_ids: [], seating_option_ids: [], 
        aluminum_option_ids: [], lighting_option_ids: [], finishing_option_ids: [], cooler_option_ids: [], wetsound_package_ids: [], 
        additional_option_ids: [], trailer_upgrade_ids: [])
    end




end
