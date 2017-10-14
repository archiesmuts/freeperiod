class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assessment, only: [:new, :create, :show]
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = @assessment.results.build
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    @result = @assessment.results.build(result_params)

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: @result }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to [@result.assessment, @result], notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to [@assessment.lesson_plan, @assessment], notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
      format.js {  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.friendly.find(params[:assessment_id])
    end
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:student_score, :teacher_comment, :registration_id, :assessment_id)
    end
end
