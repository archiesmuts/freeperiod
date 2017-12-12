module UserRegistrationsHelper
  def user_role_check(user_registration)
    if user_registration.user.has_role?(:educator, user_registration.school)
      content_tag(:span, "educator")
    elsif  user_registration.user.has_role?(:learner, user_registration.school)
      content_tag(:span, "learner")
    end
  end
end
