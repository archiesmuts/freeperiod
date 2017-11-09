class UserRegistrations::AchievementsController < AchievementsController
  before_action :set_achievable

  private

    def set_achievable
      @achievable = UserRegistration.friendly.find(params[:user_registration_id])
    end
end
