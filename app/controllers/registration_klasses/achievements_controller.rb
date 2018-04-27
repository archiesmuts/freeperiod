class RegistrationKlasses::AchievementsController < AchievementsController
  before_action :set_achievable

  private
  def set_achievable
    @achievable = RegistrationKlass.friendly.find(params[:registration_klass_id])
  end
end
