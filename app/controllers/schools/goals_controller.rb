class Schools::GoalsController < GoalsController
  before_action :set_goalable

  private

    def set_goalable
      @goalable = School.friendly.find(params[:school_id])
    end
end
