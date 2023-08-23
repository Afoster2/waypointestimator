class BoatModelsController < ApplicationController
  before_action :set_boat_model, only: [:show, :edit, :update, :destroy]

  # GET /boat_models
  def index
    @boat_models = BoatModel.all
  end

  # GET /boat_models/1
  def show
    @boat_model = BoatModel.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @boat_model.as_json(only: [:length, :beam, :max_hp, :hull_weight, :max_passengers, :price_hull, :price_trailer_hull, :name, :stock_number, :style, :year, 
        standard_features_attributes: [:id, :name, :description, :price, :_destroy],
        power_options_attributes: [:id, :brand, :model_number, :description, :price, :engine_model, :engine_make, :year, :serial_number, :_destroy],
        console_options_attributes: [:id, :name, :description, :price, :_destroy],
        factory_options_attributes: [:id, :name, :description, :price, :_destroy],
        gauge_upgrades_attributes: [:id, :name, :description, :price, :_destroy],
        seating_options_attributes: [:id, :name, :description, :price, :_destroy],
        aluminum_options_attributes: [:id, :name, :description, :price, :_destroy],
        lighting_options_attributes: [:id, :name, :description, :price, :_destroy],
        finishing_options_attributes: [:id, :name, :description, :price, :_destroy],
        cooler_options_attributes: [:id, :name, :description, :price, :_destroy],
        wetsound_packages_attributes: [:id, :name, :description, :price, :_destroy],
        additional_options_attributes: [:id, :name, :description, :price, :_destroy],
        trailer_upgrades_attributes: [:id, :name, :description, :price, :_destroy]]) }
    end
  end

  # GET /boat_models/new
  def new
    @boat_model = BoatModel.new
  end

  # GET /boat_models/1/edit
  def edit
  end

  # POST /boat_models
  def create
    @boat_model = BoatModel.new(boat_model_params)

    if @boat_model.save
      redirect_to @boat_model, notice: 'Boat model was successfully created.'
    else
      flash[:error] = 'There was an error creating the boat model.'
      redirect_to new_boat_model_path
    end
  end

  # PATCH/PUT /boat_models/1
  def update
    if @boat_model.update(boat_model_params)
      redirect_to @boat_model, notice: 'Boat model was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /boat_models/1
  def destroy
    @boat_model = BoatModel.find(params[:id])
    @boat_model.destroy
    respond_to do |format|
      format.turbo_stream { redirect_to boat_models_path, status: :see_other }
      format.html { redirect_to boat_models_path, notice: 'Boat model was successfully destroyed.' }
    end
  end

  # GET /boat_models/1/options
  def options
    boat_model = BoatModel.find(params[:id])
    render json: {
      standard_features: boat_model.standard_features,
      power_options: boat_model.power_options,
      console_options: boat_model.console_options,
      factory_options: boat_model.factory_options,
      gauge_upgrades: boat_model.gauge_upgrades,
      seating_options: boat_model.seating_options,
      aluminum_options: boat_model.aluminum_options,
      lighting_options: boat_model.lighting_options,
      finishing_options: boat_model.finishing_options,
      cooler_options: boat_model.cooler_options,
      wetsound_packages: boat_model.wetsound_packages,
      additional_options: boat_model.additional_options,
      trailer_upgrades: boat_model.trailer_upgrades
    }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat_model
      @boat_model = BoatModel.includes(:standard_features, :power_options, :console_options, :factory_options, :gauge_upgrades, :seating_options, :aluminum_options, :lighting_options, :finishing_options, :cooler_options, :wetsound_packages, :additional_options, :trailer_upgrades).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def boat_model_params
      params.require(:boat_model).permit(:length, :beam, :max_hp, :hull_weight, :max_passengers, :price_hull, :price_trailer_hull, :name, :stock_number, :style, :year, 
        standard_features_attributes: [:id, :name, :description, :price, :_destroy],
        power_options_attributes: [:id, :brand, :model_number, :description, :price, :engine_model, :engine_make, :year, :serial_number, :_destroy],
        console_options_attributes: [:id, :name, :description, :price, :_destroy],
        factory_options_attributes: [:id, :name, :description, :price, :_destroy],
        gauge_upgrades_attributes: [:id, :name, :description, :price, :_destroy],
        seating_options_attributes: [:id, :name, :description, :price, :_destroy],
        aluminum_options_attributes: [:id, :name, :description, :price, :_destroy],
        lighting_options_attributes: [:id, :name, :description, :price, :_destroy],
        finishing_options_attributes: [:id, :name, :description, :price, :_destroy],
        cooler_options_attributes: [:id, :name, :description, :price, :_destroy],
        wetsound_packages_attributes: [:id, :name, :description, :price, :_destroy],
        additional_options_attributes: [:id, :name, :description, :price, :_destroy],
        trailer_upgrades_attributes: [:id, :name, :description, :price, :_destroy]
      )
    end
end
