class Schools::AchievementsController < AchievementsController
  before_action :set_achievable

  private

    def set_achievable
      @achievable = School.friendly.find(params[:school_id])
    end
end
