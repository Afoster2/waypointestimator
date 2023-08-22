class EstimatesController < ApplicationController
  before_action :set_estimate, only: %i[ show edit update destroy ]
  before_action :set_user, only: [:create, :update]
  before_action :set_default_boat_model, only: [:new]

  # GET /estimates or /estimates.json
  def index
    @estimates = Estimate.all.order(created_at: :desc)
  end

  # GET /estimates/1 or /estimates/1.json
  def show
    @boat_model = @estimate.boat_model
  end

  # GET /estimates/new
  def new
    @estimate = Estimate.new
    @boat_model = BoatModel.first
    unless @boat_model
      flash[:alert] = "Please add a boat model first."
      redirect_to boat_models_path # Assuming you have a boat models controller and path
    end
  end

  # GET /estimates/1/edit
  def edit
    @boat_model = @estimate.boat_model || BoatModel.first
  end

  # POST /estimates or /estimates.json
  def create
    @estimate = Estimate.new(estimate_params)
    @estimate.user = @user

    respond_to do |format|
      if @estimate.save

        @estimate.power_option_ids = params[:estimate][:power_options_ids]
        @estimate.console_option_ids = params[:estimate][:console_options_ids]
        @estimate.factory_option_ids = params[:estimate][:factory_options_ids]
        @estimate.gauge_upgrade_ids = params[:estimate][:gauge_upgrades_ids]
        @estimate.seating_option_ids = params[:estimate][:seating_options_ids]
        @estimate.aluminum_option_ids = params[:estimate][:aluminum_options_ids]
        @estimate.lighting_option_ids = params[:estimate][:lighting_options_ids]
        @estimate.finishing_option_ids = params[:estimate][:finishing_options_ids]
        @estimate.cooler_option_ids = params[:estimate][:cooler_options_ids]
        @estimate.wetsound_package_ids = params[:estimate][:wetsound_packages_ids]
        @estimate.additional_option_ids = params[:estimate][:additional_options_ids]
        @estimate.trailer_upgrade_ids = params[:estimate][:trailer_upgrades_ids]


        format.html { redirect_to @estimate, notice: 'Estimate was successfully created.' }
        format.json { render :show, status: :created, location: @estimate }
      else
        format.html { render :new }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimates/1 or /estimates/1.json
  def update
    respond_to do |format|
      @estimate = Estimate.find(params[:id])
      if estimate_params[:customer_id].blank? && @estimate.customer_id.present?
        params[:estimate][:customer_id] = @estimate.customer_id
      end

      @estimate.boat_model_id = params[:estimate][:boat_model_id]
      if @estimate.update(estimate_params)

        @estimate.power_option_ids = params[:estimate][:power_options_ids]
        @estimate.console_option_ids = params[:estimate][:console_options_ids]
        @estimate.factory_option_ids = params[:estimate][:factory_options_ids]
        @estimate.gauge_upgrade_ids = params[:estimate][:gauge_upgrades_ids]
        @estimate.seating_option_ids = params[:estimate][:seating_options_ids]
        @estimate.aluminum_option_ids = params[:estimate][:aluminum_options_ids]
        @estimate.lighting_option_ids = params[:estimate][:lighting_options_ids]
        @estimate.finishing_option_ids = params[:estimate][:finishing_options_ids]
        @estimate.cooler_option_ids = params[:estimate][:cooler_options_ids]
        @estimate.wetsound_package_ids = params[:estimate][:wetsound_packages_ids]
        @estimate.additional_option_ids = params[:estimate][:additional_options_ids]
        @estimate.trailer_upgrade_ids = params[:estimate][:trailer_upgrades_ids]


        format.html { redirect_to estimate_url(@estimate), notice: "Estimate was successfully updated." }
        format.json { render :show, status: :ok, location: @estimate }
      else
        puts @estimate.errors.full_messages
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
        # puts "======= DEBUGGING ======="
        # puts estimate_params.inspect
      end
      puts "Boat Model ID: #{@estimate.boat_model_id}"
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

    def set_user
      @user = current_user
    end

    def set_default_boat_model
      @boat_model = BoatModel.first
    end

    # Only allow a list of trusted parameters through.
    def estimate_params
      params.require(:estimate).permit(
        :customer_id, :boat_model_id, :subtotal, :tax, :vit, :doc_fee, :registration, :total_price,
        power_option_ids: [], console_option_ids: [], factory_option_ids: [], gauge_upgrade_ids: [], seating_option_ids: [], 
        aluminum_option_ids: [], lighting_option_ids: [], finishing_option_ids: [], cooler_option_ids: [], wetsound_package_ids: [], 
        additional_option_ids: [], trailer_upgrade_ids: []
      )
    end

end
