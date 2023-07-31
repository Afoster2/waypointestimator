class BoatModelsController < ApplicationController
  before_action :set_boat_model, only: %i[ show edit update destroy ]

  # GET /boat_models or /boat_models.json
  def index
    @boat_models = BoatModel.all
  end

  # GET /boat_models/1 or /boat_models/1.json
  def show
  end

  # GET /boat_models/new
  def new
    @boat_model = BoatModel.new
  end

  # GET /boat_models/1/edit
  def edit
  end

  # POST /boat_models or /boat_models.json
  def create
    @boat_model = BoatModel.new(boat_model_params)

    respond_to do |format|
      if @boat_model.save
        format.html { redirect_to boat_model_url(@boat_model), notice: "Boat model was successfully created." }
        format.json { render :show, status: :created, location: @boat_model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @boat_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boat_models/1 or /boat_models/1.json
  def update
    respond_to do |format|
      if @boat_model.update(boat_model_params)
        format.html { redirect_to boat_model_url(@boat_model), notice: "Boat model was successfully updated." }
        format.json { render :show, status: :ok, location: @boat_model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @boat_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boat_models/1 or /boat_models/1.json
  def destroy
    @boat_model.destroy

    respond_to do |format|
      format.html { redirect_to boat_models_url, notice: "Boat model was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat_model
      @boat_model = BoatModel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
  def boat_model_params
    params.require(:boat_model).permit(:length, :beam, :max_hp, :hull_weight, :max_passengers, :price_hull, :price_trailer_hull, :name, :stock_number, :style, :year)
  end
end
