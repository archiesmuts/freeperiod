class MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.order("slug ASC")
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)
    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership.school, notice: 'School Account was successfully created.' }
        format.json { render :show, status: :created, location: @membership }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    user = @membership.user
    school = @membership.school
    current_role = @membership.primary_role.to_sym
    respond_to do |format|
      if @membership.update(membership_params)
        if @membership.primary_role_changed?
          user.remove_role(current_role, school)
          case @membership.primary_role.to_sym
            when :account_owner
              user.add_role("account_owner", school)
            when :staff
              user.add_role("staff", school)
            when :educator
              user.add_role("educator", school)
            when :learner
              user.add_role("learner", school)
            when :parent_or_guardian
              user.add_role("parent", school)
            when :friend_of_school
              user.add_role("friend", school)
          end
        end
        format.html { redirect_to @membership, notice: 'School registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    user = @membership.user
    school = @membership.school
    user_roles = user.roles
    @membership.destroy
    user_roles.delete_all
    respond_to do |format|
      format.html { redirect_to school_memberships_path(@membership.school), notice: 'Scool registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:user_id, :school_id, :primary_role, :school_name,
        :user_name, :slug,
        { details: [:date_enrolled, :date_completed, :current_grades, :other_roles] })
    end
end
