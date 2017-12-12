class Users::AchievementsController < AchievementsController
  before_action :set_achievable

  private

    def set_achievable
      @achievable = User.friendly.find(params[:user_id])
    end
end
