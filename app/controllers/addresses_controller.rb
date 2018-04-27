class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = @addressable.addresses.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = @addressable.addresses.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to [@address.addressable, @address], notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    @addressable = @address.addressable
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to [@addressable, @address], notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @addressable = @address.addressable
    @address.destroy
    respond_to do |format|
      format.html { redirect_to @addressable, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:address, :address_type, :slug)
    end
end
