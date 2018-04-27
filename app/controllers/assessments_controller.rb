class AssessmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson_plan, only: [:new, :create, :show, :update]
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]

  # GET /assessments
  # GET /assessments.json
  def index
    @assessments = Assessment.order.(:created_at)
  end

  # GET /assessments/1
  # GET /assessments/1.json
  def show
  end

  # GET /assessments/new
  def new
    @assessment = @lesson_plan.assessments.build
  end

  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments
  # POST /assessments.json
  def create
    @assessment = @lesson_plan.assessments.build(assessment_params)

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to [@lesson_plan, @assessment], notice: 'Assessment was successfully created.' }
        format.json { render :show, status: :created, location: @assessment }
        format.js { }

      else
        format.html { render :new }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }

      end
    end
  end

  # PATCH/PUT /assessments/1
  # PATCH/PUT /assessments/1.json
  def update
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to [@lesson_plan, @assessment], notice: 'Assessment was successfully updated.' }
      format.json { render :show, status: :ok, location: [@lesson_plan, @assessment] }
      format.js { }
      else
        format.html { render :edit }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /assessments/1
  # DELETE /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to [@lesson_plan,registration_klass, @lesson_plan], notice: 'Assessment was successfully destroyed.' }
      format.json { head :no_content }
      format.js { }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_lesson_plan
      @lesson_plan = LessonPlan.friendly.find(params[:lesson_plan_id])
    end
    def set_assessment
      @assessment = Assessment.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_params
      params.require(:assessment).permit(:name, :value, :lesson_plan_id, :assessment_type_id,
                    :assessment_task_id, :slug, {user_registration_ids: []})
    end
end
