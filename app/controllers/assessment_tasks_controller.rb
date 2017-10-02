class AssessmentTasksController < ApplicationController
  before_action :set_assessment_task, only: [:show, :edit, :update, :destroy]

  # GET /assessment_tasks
  # GET /assessment_tasks.json
  def index
    @assessment_tasks = AssessmentTask.all
  end

  # GET /assessment_tasks/1
  # GET /assessment_tasks/1.json
  def show
  end

  # GET /assessment_tasks/new
  def new
    @assessment_task = AssessmentTask.new
  end

  # GET /assessment_tasks/1/edit
  def edit
  end

  # POST /assessment_tasks
  # POST /assessment_tasks.json
  def create
    @assessment_task = AssessmentTask.new(assessment_task_params)

    respond_to do |format|
      if @assessment_task.save
        format.html { redirect_to @assessment_task, notice: 'Assessment task was successfully created.' }
        format.json { render :show, status: :created, location: @assessment_task }
      else
        format.html { render :new }
        format.json { render json: @assessment_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_tasks/1
  # PATCH/PUT /assessment_tasks/1.json
  def update
    respond_to do |format|
      if @assessment_task.update(assessment_task_params)
        format.html { redirect_to @assessment_task, notice: 'Assessment task was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment_task }
      else
        format.html { render :edit }
        format.json { render json: @assessment_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_tasks/1
  # DELETE /assessment_tasks/1.json
  def destroy
    @assessment_task.destroy
    respond_to do |format|
      format.html { redirect_to assessment_tasks_url, notice: 'Assessment task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_task
      @assessment_task = AssessmentTask.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_task_params
      params.require(:assessment_task).permit(:name, :slug, :assessment_type_id)
    end
end
