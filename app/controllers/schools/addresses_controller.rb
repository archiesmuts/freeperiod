class Schools::AddressesController < AddressesController
  before_action :set_addressable

  private

    def set_addressable
      @addressable = School.friendly.find(params[:school_id])
    end
end
