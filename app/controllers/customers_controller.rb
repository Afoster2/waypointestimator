class CustomersController < ApplicationController
  load_and_authorize_resource
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    if current_user
      @customers = current_user.customers
    else
      # If there is no current_user, redirect to the login page or show an error.
      redirect_to new_user_session_path, alert: 'You must be logged in to view customers.'
    end
  end

  # GET /customers/1
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  def new
    @customer = current_user.customers.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = current_user.customers.build(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  def search
    if params[:query].present?
      # Adjust the query to search by first_name and last_name
      @customers = Customer.where('first_name LIKE :query OR last_name LIKE :query OR email LIKE :query', query: "%#{params[:query]}%")
    else
      @customers = Customer.none
    end

    # Make sure to only return the necessary fields, and in the correct format
    respond_to do |format|
      format.json { render json: @customers.as_json(only: [:id, :first_name, :last_name, :email, :address, :address2, :city, :state, :zip, :phone]) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = current_user.customers.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone, :address, :address2, :city, :state, :zip, :date_contacted, :location, :notes)
      # Removed :salesperson_id from the list of permitted parameters
    end
end
