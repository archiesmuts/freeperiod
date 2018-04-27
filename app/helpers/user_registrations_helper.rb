module UserRegistrationsHelper
  def user_role_check(user_registration)
    if user_registration.user.has_role?(:educator, user_registration.school)
      content_tag(:span, "Educator", class: "badge badge-info")
    elsif  user_registration.user.has_role?(:learner, user_registration.school)
      content_tag(:span, "Learner", class: "badge badge-info")
    end
  end
end
