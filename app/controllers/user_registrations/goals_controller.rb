class UserRegistrations::GoalsController < GoalsController
  before_action :set_goalable

  private

    def set_goalable
      @goalable = UserRegistration.friendly.find(params[:user_registration_id])
    end
end
