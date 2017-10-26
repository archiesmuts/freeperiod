class Events::AddressesController < AddressesController
  before_action :set_addressable

  private

    def set_addressable
      @addressable = Event.friendly.find(params[:event_id])
    end
end
