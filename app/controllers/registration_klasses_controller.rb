class RegistrationKlassesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_registration_klass, only: [:show, :edit, :update, :destroy]

  # GET /registration_klasses
  # GET /registration_klasses.json
  def index
    @registration_klasses = @school.registration_klasses.all
  end

  # GET /registration_klasses/1
  # GET /registration_klasses/1.json
  def show
  end

  # GET /registration_klasses/new
  def new
    @registration_klass = @school.registration_klasses.build
  end

  # GET /registration_klasses/1/edit
  def edit
  end

  # POST /registration_klasses
  # POST /registration_klasses.json
  def create
    @registration_klass = @school.registration_klasses.build(registration_klass_params)

    respond_to do |format|
      if @registration_klass.save
        format.html { redirect_to [@school, @registration_klass], notice: 'Class was successfully created.' }
        format.json { render :show, status: :created, location: @registration_klass }
        format.js   { }
      else
        format.html { render :new }
        format.json { render json: @registration_klass.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /registration_klasses/1
  # PATCH/PUT /registration_klasses/1.json
  def update
    respond_to do |format|
      if @registration_klass.update(registration_klass_params)
        format.html { redirect_to [@school, @registration_klass], notice: 'Class was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration_klass }
        format.js   { }
      else
        format.html { render :edit }
        format.json { render json: @registration_klass.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /registration_klasses/1
  # DELETE /registration_klasses/1.json
  def destroy
    @registration_klass.destroy
    respond_to do |format|
      format.html { redirect_to school_registration_klasses_path(@school), notice: 'Class was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.friendly.find(params[:school_id])
    end

    def set_registration_klass
      @registration_klass = RegistrationKlass.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_klass_params
      params.require(:registration_klass).permit(:name, :school_id, :course_id, :year, :klass_type,
                      :course_name, :slug, { user_ids: [] })
    end
end
