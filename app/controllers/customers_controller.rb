class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    @customers = current_user.customers
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = current_user.customers.new
  end

  # GET /customers/1/edit
	def edit
	  @customer = Customer.find(params[:id])
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
	  @customer = Customer.find(params[:id])
	  if @customer.update(customer_params)
	    redirect_to @customer
	  else
	    render :edit
	  end
	end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = current_user.customers.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone, :address, :address2, :city, :state, :zip, :date_contacted, :location, :notes)
    end
end
