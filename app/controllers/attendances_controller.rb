class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = @attendable.attendances.order("date")
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = @attendable.attendances.new(attendance_params)
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to [@attendance.attendable, @attendance], notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    @attendable = @attendance.attendable
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to polymorphic_url([@attendable.registration_klass, @attendable]), notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendable = @attendance.attendable
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to @attendable, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
      format.js {  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:comment, :date, :attendable_id,
        :attendable_type, {details: [:more_information]})
    end
end
