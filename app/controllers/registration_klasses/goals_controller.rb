class RegistrationKlasses::GoalsController < GoalsController
  before_action :set_goalable

  private

    def set_goalable
      @goalable = RegistrationKlass.friendly.find(params[:registration_klass_id])
    end
end
