class ActionPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [:index, :new, :create, :show, :edit, :update, :destroy, :sort ]
  before_action :set_action_plan, only: [:show, :edit, :update, :destroy]

  # GET /action_plans
  # GET /action_plans.json
  def index
    @action_plans = @goal.action_plans.order("position ASC")
  end
    # source https://gorails.com/episodes/sortable-drag-and-drop
  def sort
    @action_plans = @goal.action_plans.all
    params[:action_plan].each_with_index do |id, index|
      ActionPlan.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end
  # GET /action_plans/1
  # GET /action_plans/1.json
  def show
  end

  # GET /action_plans/new
  def new
    @action_plan = @goal.action_plans.build
  end

  # GET /action_plans/1/edit
  def edit
  end

  # POST /action_plans
  # POST /action_plans.json
  def create
    @action_plan = @goal.action_plans.build(action_plan_params)

    respond_to do |format|
      if @action_plan.save
        format.html { redirect_to [@goal, @action_plan], notice: 'Action plan was successfully created.' }
        format.json { render :show, status: :created, location: @action_plan }
        format.js   { }
      else
        format.html { render :new }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /action_plans/1
  # PATCH/PUT /action_plans/1.json
  def update
    respond_to do |format|
      if @action_plan.update(action_plan_params)
        format.html { redirect_to [@goal.goalable, @action_plan.goal], notice: 'Action plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_plan }
        format.js   { }
      else
        format.html { render :edit }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /action_plans/1
  # DELETE /action_plans/1.json
  def destroy
    @action_plan.destroy
    respond_to do |format|
      format.html { redirect_to action_plans_url, notice: 'Action plan was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.friendly.find(params[:goal_id])
    end
    def set_action_plan
      @action_plan = ActionPlan.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_plan_params
      params.require(:action_plan).permit(:goal_id, :what, :who, :when_date, :completed, :slug)
    end
end
