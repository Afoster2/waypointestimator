class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @users = User.accessible_by(current_ability)
  end

  def show
    @user = User.find(params[:id])
    @estimates = @user.estimates # Adjust this to match your association
  end
end
