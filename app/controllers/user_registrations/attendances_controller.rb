class UserRegistrations::AttendancesController < AttendancesController
  before_action :set_attendable

  private

    def set_attendable
      @attendable = UserRegistration.friendly.find(params[:user_registration_id])
    end
end
