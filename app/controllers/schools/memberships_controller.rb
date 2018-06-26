class Schools::MembershipsController < ApplicationController
  # this controller is for creating invitations
  before_action :authenticate_user!
  before_action :set_school

  layout "application_alt"

  def index
    memberships = @school.memberships.all
    membership = Membership.new
    # TODO add slug containing user.last_name_reversed for orderinf the index view
  end
  # def edit
  # end

  def create
    membership = @school.memberships.new(membership_params)
    membership.school = @school
    respond_to do |format|
      if membership.save
        # TODO send email notification of school id users is already active or registered
        format.html { redirect_to school_path(@school), notice: 'Invitation was successfully sent.' }
        format.json { render :show, status: :created, location: membership }
        format.js { }
      else
        format.html { redirect_to school_path(@school, anchor: "school-memberships-tab"), flash:  {error: 'Enter an email address'}}
        format.json { render json: membership.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end
  def edit_multiple
    @memberships = @school.memberships.where(id: params[:membership_ids])
  end

  def update_multiple
    @memberships = @school.memberships.update(params[:memberships].keys, params[:memberships].values)
    @memberships.each do |membership, school, user|
      school = membership.school
      user = membership.user
      current_member = membership.member.to_sym
      user.remove_role(current_member, school)
      case membership.member.to_sym
        when :account_owner
          user.add_role("account_owner", school)
        when :school_admin
          user.add_role("school_admin", school)
        when :educator
          user.add_role("educator", school)
        when :learner
          user.add_role("learner", school)
        when :parent_or_guardian
          user.add_role("parent_or_guardian", school)
        when :friend_of_school
          user.add_role("friend_of_school", school)
      end
    end
    respond_to do |format|
      format.html { redirect_to school_memberships_path(@school), notice: 'School registrations were successfully updated.' }
      @memberships.reject! { |m| m.errors.empty? }
      if @memberships.empty?
        format.html { redirect_to school_memberships_path(@school), notice: 'Nothing was changed.' }
      else
        format.html { render "edit_multiple" }
      end
    end
  end

  private

  def set_school
    @school = current_user.schools.friendly.find(params[:school_id])
  end
  # def set_membership
  #   @membership = Membership.find(params[:id])
  # end
  def membership_params
    params.require(:membership).permit(:email, :slug)
  end
end
