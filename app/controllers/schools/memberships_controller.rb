class Schools::MembershipsController < ApplicationController
  # this controller is for creating invitations
  before_action :authenticate_user!
  before_action :set_school

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
        # user = membership.user
        # if @membership.account_owner?
        #   user.add_role(:account_owner, @school)
        # end
        # TODO send email notification of school id users is already active or registered
        format.html { redirect_to school_path(@school, anchor: "school-memberships"), notice: 'Invitation was successfully sent.' }
        format.json { render :show, status: :created, location: membership }
        format.js { }
      else
        format.html { redirect_to school_path(@school, anchor: "school-memberships"), flash:  {error: 'Enter an email address'}}
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
