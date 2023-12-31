class PagesController < ApplicationController
  def home
    if user_signed_in?
      # render the index page as usual
      @estimates = Estimate.all.order(created_at: :desc).limit(24)
      @customers = Customer.all.order('first_name ASC').limit(12)
      @users = User.all.order(last_sign_in_at: :desc)
    else
      # Redirect to the login page if no user is signed in
      redirect_to new_user_session_path
    end
  end
end
