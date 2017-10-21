class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.order("last_name, first_name")
  end
  def new
    @user = User.new
    # @user.memberships.build
    #code
  end

  def show
    @user = User.friendly.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
