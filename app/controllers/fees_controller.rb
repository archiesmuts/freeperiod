class FeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_fee, only: [:show, :edit, :update, :destroy]

  # GET /fees
  # GET /fees.json
  def index
    @fees = @school.fees.order("year DESC")
    # @fee = @school.fees.build
  end

  # GET /fees/1
  # GET /fees/1.json
  def show
  end

  # GET /fees/new
  def new
    @fee = @school.fees.build
  end

  # GET /fees/1/edit
  def edit
  end

  # POST /fees
  # POST /fees.json
  def create
    @fee = @school.fees.build(fee_params)

    respond_to do |format|
      if @fee.save
        format.html { redirect_to [@school, @fee], notice: 'Fee was successfully created.' }
        format.json { render :show, status: :created, location: @fee }
        format.js   { }
      else
        format.html { render :new }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /fees/1
  # PATCH/PUT /fees/1.json
  def update
    respond_to do |format|
      if @fee.update(fee_params)
        format.html { redirect_to [@school, @fee], notice: 'Fee was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee }
        format.js   { }
      else
        format.html { render :edit }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @fee.destroy
    respond_to do |format|
      format.html { redirect_to school_fees_path(@school), notice: ' School Fee was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.friendly.find(params[:school_id])
    end

    def set_fee
      @fee = Fee.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_params
      params.require(:fee).permit(:name, :year, :amount, :school_id, :slug, {user_registration_ids: []})
    end
end
