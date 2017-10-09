class UserRegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_registration_klass, only: [:new, :create, :show]
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /user_registrations
  # GET /user_registrations.json
  def index
    @user_registrations = UserRegistration.order("slug")
  end

  # GET /user_registrations/1
  # GET /user_registrations/1.json
  def show
  end

  # GET /user_registrations/new
  def new
    @user_registration = @registration_klass.user_registrations.build
  end

  # GET /user_registrations/1/edit
  def edit
  end

  # POST /user_registrations
  # POST /user_registrations.json
  def create
    @user_registration = @registration_klass.user_registrations.build(user_registration_params)

    respond_to do |format|
      if @user_registration.save
        format.html { redirect_to [@registration_klass, @user_registration], notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @user_registration }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @user_registration.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /user_registrations/1
  # PATCH/PUT /user_registrations/1.json
  def update
    respond_to do |format|
      if @user_registration.update(user_registration_params)
        format.html { redirect_to [@registration_klass, @user_registration], notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_registration }
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @user_registration.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /user_registrations/1
  # DELETE /user_registrations/1.json
  def destroy
    @user_registration.destroy
    respond_to do |format|
      format.html { redirect_to @registration_klass, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_klass
      @registration_klass = RegistrationKlass.friendly.find(params[:registration_klass_id])
    end

    def set_registration
      @user_registration = UserRegistration.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_registration_params
      params.require(:user_registration).permit(:registration_klass_id, :user_id,
                      :user_type, :completed, :completed_at)
    end
end
