
class Users::AddressesController < AddressesController
  before_action :set_addressable

  private

    def set_addressable
      @addressable = User.friendly.find(params[:user_id])
    end
end
