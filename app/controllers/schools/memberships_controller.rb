class Schools::MembershipsController < ApplicationController
  # this controller is for creating invitations
  before_action :authenticate_user!
  before_action :set_school

  def index
    memberships = @school.memberships.all
    membership = Membership.new
  end
  def create
    membership = @school.memberships.new(membership_params)
    membership.school = @school
    respond_to do |format|
      if membership.save
        format.html { redirect_to school_memberships_path(@school), notice: 'Invitation was successfully sent.' }
        format.json { render :show, status: :created, location: membership }
        format.js { }
      else
        format.html { redirect_to school_memberships_path(@school), notice: 'Enter an email address'}
        format.json { render json: membership.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  private

  def set_school
    @school = current_user.schools.friendly.find(params[:school_id])
  end
  def membership_params
    params.require(:membership).permit(:email, :slug)
  end
end
