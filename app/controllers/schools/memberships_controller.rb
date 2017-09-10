class Schools::MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school

  def create
    membership = @school.memberships.new(membership_params)
    membership.school = @school

    if membership.save
      InvitationMailer.invitation_instructions(@user).deliver_later
      redirect_to @school, notice: "All Good"
    else
      redirect_to @school, notice: "Oops Bad"
    end
  end

  private

  def set_school
    @school = current_user.schools.friendly.find(params[:school_id])
  end
  def membership_params
    params.require(:membership).permit(:email)
  end
end
