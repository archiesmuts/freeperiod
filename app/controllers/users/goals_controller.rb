class Users::GoalsController < GoalsController
  before_action :set_goalable

  private

    def set_goalable
      @goalable = User.friendly.find(params[:user_id])
    end
end
