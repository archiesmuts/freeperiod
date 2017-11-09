class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index

    @goals = @goalable.goals.order("deadline ASC")
    @goal = Goal.new
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goaladdressables
  # POST /goals.json
  def create
    @goal = @goalable.goals.new(goal_params)
    respond_to do |format|
      if @goal.save
        format.html { redirect_to [@goalable, @goal], notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    @goalable = @goal.goalable
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to [@goalable, @goal], notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goalable = @goal.goalable
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path([@goalable, Goal]), notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:name, :deadline, :achievability, :measurement, :person_responsible, :achieved, :completed_at, :slug)
    end
end
