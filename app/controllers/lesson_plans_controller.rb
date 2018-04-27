class LessonPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_registration_klass
  before_action :set_lesson_plan, only: [:show, :edit, :update, :destroy]

  # GET /lesson_plans
  # GET /lesson_plans.json
  def index
    @lesson_plans = LessonPlan.order(:created_at)
  end

  # GET /lesson_plans/1
  # GET /lesson_plans/1.json
  def show
  end

  # GET /lesson_plans/new
  def new
    @lesson_plan = @registration_klass.lesson_plans.build
  end

  # GET /lesson_plans/1/edit
  def edit
  end

  # POST /lesson_plans
  # POST /lesson_plans.json
  def create
    @lesson_plan = @registration_klass.lesson_plans.build(lesson_plan_params)

    respond_to do |format|
      if @lesson_plan.save
        format.html { redirect_to [@registration_klass, @lesson_plan], notice: 'Lesson plan was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_plan }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @lesson_plan.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /lesson_plans/1
  # PATCH/PUT /lesson_plans/1.json
  def update
    respond_to do |format|
      if @lesson_plan.update(lesson_plan_params)
        format.html { redirect_to [@registration_klass, @lesson_plan], notice: 'Lesson plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_plan }
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @lesson_plan.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /lesson_plans/1
  # DELETE /lesson_plans/1.json
  def destroy
    @lesson_plan.destroy
    respond_to do |format|
      format.html { redirect_to lesson_plans_url, notice: 'Lesson plan was successfully destroyed.' }
      format.json { head :no_content }
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_klass
      @registration_klass = RegistrationKlass.friendly.find(params[:registration_klass_id])
    end

    def set_lesson_plan
      @lesson_plan = LessonPlan.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_plan_params
      params.require(:lesson_plan).permit(:name, :registration_klass_id, :term, :slug)
    end
end
