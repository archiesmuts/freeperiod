module AchievementsHelper
  # link generator for back button @achievable in a nested resource context
  def achievement_link_generator(achievement)
    parent_class = achievement.achievable
    case parent_class.class
    when UserRegistration
      html = ""
      html += link_to "Cancel", [@achievable.registration_klass, @achievable]
      html.html_safe
    when RegistrationKlass
      html = ""
      html += link_to "Cancel", [@achievable.school, @achievable]
      html.html_safe
    when School
      html = ""
      html += link_to "Cancel", [@achievable]
      html.html_safe
    when User
      html = ""
      html += link_to "Cancel", [@achievable]
      html.html_safe
    end
  end
end
