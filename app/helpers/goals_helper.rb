module GoalsHelper
  # TODO Include links in helper file
  # link generator for back button @goalable in a nested resource context
  def link_generator(goal)
    parent_class = goal.goalable.class.to_s
    case parent_class
    when "User"
      html = ""
      html << (link_to [@goalable] do
              fa_icon("arrow-left", text: "My home page")
              end)
      html.html_safe
    when "School"
      html = ""
      html << (link_to [@goalable] do
              fa_icon("arrow-left", text: "School home")
              end)
      html.html_safe
    when "UserRegistration"
      html = ""
      html << (link_to [@goalable.registration_klass, @goalable] do
              fa_icon("arrow-left", text: "Registration home")
              end)
      html.html_safe
    when "RegistrationKlass"
      html = ""
      html << (link_to [@goalable.school, @goalable] do
              fa_icon("arrow-left", text: "Class home")
              end)
      html.html_safe
    end
  end

  # contextualize the goal, i.e. for a user, display Personal etc.
  def show_name_display(goal)
    parent_class = goal.goalable.class.to_s
    case parent_class
    when "User"
      content_tag(:span, "Personal Goal")
    when "School"
      content_tag(:span, "School Goal")
    when "UserRegistration"
      content_tag(:span, "Subject Goal")
    when "RegistrationKlass"
      content_tag(:span, "Class Goal")
    end
  end

  def show_polymorphic_parent_name(goal)
    parent_class = goal.goalable.class.to_s
    case parent_class
    when "User"
      html = ""
      html << (@goalable.name)
      html.html_safe
    when "School"
      html = ""
      html << (@goalable.name)
      html.html_safe
    when "UserRegistration"
      html = ""
      html << (@goalable.registration_klass.course_name)
      html.html_safe
    when "RegistrationKlass"
      html = ""
      html << (@goalable.course_name)
      html.html_safe
    end
  end
end
