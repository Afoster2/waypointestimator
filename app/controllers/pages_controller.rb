class PagesController < ApplicationController
  def home
    @estimates = Estimate.all.order(created_at: :desc).limit(4)
    @customers = Customer.all.order('first_name ASC').limit(8)
  end
end
