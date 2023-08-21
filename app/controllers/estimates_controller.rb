class EstimatesController < ApplicationController
  before_action :set_estimate, only: %i[ show edit update destroy ]
  before_action :set_user, only: [:create, :update]

  # GET /estimates or /estimates.json
  def index
    @estimates = Estimate.all.order(created_at: :desc)
  end

  # GET /estimates/1 or /estimates/1.json
  def show
    @estimate = Estimate.find(params[:id])
    puts @estimate.inspect
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
    @estimate.user = @user

    respond_to do |format|
      if @estimate.save

        # Save power options
        params[:estimate][:power_options_ids]&.each do |power_option_id|
          @estimate.estimate_power_options.create(power_option_id: power_option_id)
        end

        # Save console options
        params[:estimate][:console_options_ids]&.each do |console_option_id|
          @estimate.estimate_console_options.create(console_option_id: console_option_id)
        end

        # Save factory options
        params[:estimate][:factory_options_ids]&.each do |factory_option_id|
          @estimate.estimate_factory_options.create(factory_option_id: factory_option_id)
        end

        # Save gauge upgrades
        params[:estimate][:gauge_upgrades_ids]&.each do |gauge_upgrade_id|
          @estimate.estimate_gauge_upgrades.create(gauge_upgrade_id: gauge_upgrade_id)
        end

        # Save seating options
        params[:estimate][:seating_options_ids]&.each do |seating_option_id|
          @estimate.estimate_seating_options.create(seating_option_id: seating_option_id)
        end

        # Save aluminum options
        params[:estimate][:aluminum_options_ids]&.each do |aluminum_option_id|
          @estimate.estimate_aluminum_options.create(aluminum_option_id: aluminum_option_id)
        end

        # Save lighting options
        params[:estimate][:lighting_options_ids]&.each do |lighting_option_id|
          @estimate.estimate_lighting_options.create(lighting_option_id: lighting_option_id)
        end

        # Save finishing options
        params[:estimate][:finishing_options_ids]&.each do |finishing_option_id|
          @estimate.estimate_finishing_options.create(finishing_option_id: finishing_option_id)
        end

        # Save cooler options
        params[:estimate][:cooler_options_ids]&.each do |cooler_option_id|
          @estimate.estimate_cooler_options.create(cooler_option_id: cooler_option_id)
        end

        # Save wetsound packages
        params[:estimate][:wetsound_packages_ids]&.each do |wetsound_package_id|
          @estimate.estimate_wetsound_packages.create(wetsound_package_id: wetsound_package_id)
        end

        # Save additional options
        params[:estimate][:additional_options_ids]&.each do |additional_option_id|
          @estimate.estimate_additional_options.create(additional_option_id: additional_option_id)
        end

        # Save trailer upgrades
        params[:estimate][:trailer_upgrades_ids]&.each do |trailer_upgrade_id|
          @estimate.estimate_trailer_upgrades.create(trailer_upgrade_id: trailer_upgrade_id)
        end


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

      if @estimate.update(estimate_params)

        @estimate.estimate_power_options.destroy_all
        @estimate.estimate_console_options.destroy_all
        @estimate.estimate_factory_options.destroy_all
        @estimate.estimate_gauge_upgrades.destroy_all
        @estimate.estimate_seating_options.destroy_all
        @estimate.estimate_aluminum_options.destroy_all
        @estimate.estimate_lighting_options.destroy_all
        @estimate.estimate_finishing_options.destroy_all
        @estimate.estimate_cooler_options.destroy_all
        @estimate.estimate_wetsound_packages.destroy_all
        @estimate.estimate_additional_options.destroy_all
        @estimate.estimate_trailer_upgrades.destroy_all

        # Save power options
        params[:estimate][:power_options_ids]&.each do |power_option_id|
          @estimate.estimate_power_options.create(power_option_id: power_option_id)
        end

        # Save console options
        params[:estimate][:console_options_ids]&.each do |console_option_id|
          @estimate.estimate_console_options.create(console_option_id: console_option_id)
        end

        # Save factory options
        params[:estimate][:factory_options_ids]&.each do |factory_option_id|
          @estimate.estimate_factory_options.create(factory_option_id: factory_option_id)
        end

        # Save gauge upgrades
        params[:estimate][:gauge_upgrades_ids]&.each do |gauge_upgrade_id|
          @estimate.estimate_gauge_upgrades.create(gauge_upgrade_id: gauge_upgrade_id)
        end

        # Save seating options
        params[:estimate][:seating_options_ids]&.each do |seating_option_id|
          @estimate.estimate_seating_options.create(seating_option_id: seating_option_id)
        end

        # Save aluminum options
        params[:estimate][:aluminum_options_ids]&.each do |aluminum_option_id|
          @estimate.estimate_aluminum_options.create(aluminum_option_id: aluminum_option_id)
        end

        # Save lighting options
        params[:estimate][:lighting_options_ids]&.each do |lighting_option_id|
          @estimate.estimate_lighting_options.create(lighting_option_id: lighting_option_id)
        end

        # Save finishing options
        params[:estimate][:finishing_options_ids]&.each do |finishing_option_id|
          @estimate.estimate_finishing_options.create(finishing_option_id: finishing_option_id)
        end

        # Save cooler options
        params[:estimate][:cooler_options_ids]&.each do |cooler_option_id|
          @estimate.estimate_cooler_options.create(cooler_option_id: cooler_option_id)
        end

        # Save wetsound packages
        params[:estimate][:wetsound_packages_ids]&.each do |wetsound_package_id|
          @estimate.estimate_wetsound_packages.create(wetsound_package_id: wetsound_package_id)
        end

        # Save additional options
        params[:estimate][:additional_options_ids]&.each do |additional_option_id|
          @estimate.estimate_additional_options.create(additional_option_id: additional_option_id)
        end

        # Save trailer upgrades
        params[:estimate][:trailer_upgrades_ids]&.each do |trailer_upgrade_id|
          @estimate.estimate_trailer_upgrades.create(trailer_upgrade_id: trailer_upgrade_id)
        end

        format.html { redirect_to estimate_url(@estimate), notice: "Estimate was successfully updated." }
        format.json { render :show, status: :ok, location: @estimate }
      else
        puts @estimate.errors.full_messages
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
        # puts "======= DEBUGGING ======="
        # puts estimate_params.inspect
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

    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def estimate_params
      params.require(:estimate).permit(:customer_id, :boat_model_id, :subtotal, :tax, :vit, :doc_fee, :registration, :total_price,
        power_options_ids: [], console_options_ids: [], factory_options_ids: [], gauge_upgrades_ids: [], seating_options_ids: [], 
        aluminum_options_ids: [], lighting_options_ids: [], finishing_options_ids: [], cooler_options_ids: [], wetsound_packages_ids: [], 
        additional_option_ids: [], trailer_upgrades_ids: [])
    end


end
