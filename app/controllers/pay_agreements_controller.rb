class PayAgreementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fee, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_pay_agreement, only: [:show, :edit, :update, :destroy]


  # GET /pay_agreements
  # GET /pay_agreements.json
  def index
    @pay_agreements = @fee.pay_agreements.order(:slug)
  end

  # GET /pay_agreements/1
  # GET /pay_agreements/1.json
  def show
  end

  # GET /pay_agreements/new
  def new
    @pay_agreement = @fee.pay_agreements.build
  end

  # GET /pay_agreements/1/edit
  def edit
  end

  # POST /pay_agreements
  # POST /pay_agreements.json
  def create
    @pay_agreement = @fee.pay_agreements.build(pay_agreement_params)

    respond_to do |format|
      if @pay_agreement.save
        format.html { redirect_to @pay_agreement, notice: 'Pay agreement was successfully created.' }
        format.json { render :show, status: :created, location: @pay_agreement }
        format.js   { }
      else
        format.html { render :new }
        format.json { render json: @pay_agreement.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /pay_agreements/1
  # PATCH/PUT /pay_agreements/1.json
  def update
    respond_to do |format|
      if @pay_agreement.update(pay_agreement_params)
        format.html { redirect_to [@fee, @pay_agreement], notice: 'Pay agreement was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay_agreement }
        format.js   { }
      else
        format.html { render :edit }
        format.json { render json: @pay_agreement.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /pay_agreements/1
  # DELETE /pay_agreements/1.json
  def destroy
    @pay_agreement.destroy
    respond_to do |format|
      format.html { redirect_to fee_pay_agreements_path(@fee), notice: 'Pay agreement was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee
      @fee = Fee.friendly.friendly.find(params[:fee_id])
    end

    def set_pay_agreement
      @pay_agreement = PayAgreement.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_agreement_params

      params.require(:pay_agreement).permit(:fee_id, :user_registration_id, :discount, :discount_in_percent, :comment, :slug)
    end
end
