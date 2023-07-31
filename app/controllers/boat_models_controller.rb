class BoatModelsController < ApplicationController
  before_action :set_boat_model, only: [:show, :edit, :update, :destroy]

  # GET /boat_models
  def index
    @boat_models = BoatModel.all
  end

  # GET /boat_models/1
  def show
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
      render :new
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
    @boat_model.destroy
    redirect_to boat_models_url, notice: 'Boat model was successfully destroyed.'
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
        power_options_attributes: [:id, :name, :description, :price, :engine_model, :engine_make, :year, :serial_number, :_destroy],
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
