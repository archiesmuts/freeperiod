class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_registration_klass, only: [:new, :create, :show]
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.order("slug")
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = @registration_klass.registrations.build
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = @registration_klass.registrations.build(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to [@registration_klass, @registration], notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to [@registration_klass, @registration], notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
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
      @registration = Registration.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:registration_klass_id, :user_id, :user_type, :completed, :completed_at)
    end
end
