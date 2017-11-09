module AchievementsHelper
  # link generator for back button @achievable in a nested resource context
  def link_generator(achievement)
    parent_class = achievement.achievable.class
    case
    when UserRegistration
      html = ""
      html += link_to "Cancel", [@achievable.registration_klass, @achievable]
      html.html_safe
    when RegistrationKlass
      html = ""
      html += link_to "Cancel", [@achievable.school, @achievable]
      html.html_safe
    when School || User
      html = ""
      html += link_to "Cancel", [@achievable]
      html.html_safe
    end
  end
end
