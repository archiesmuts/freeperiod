module GoalsHelper
  # TODO Include links in helper file
  # link generator for back button @goalable in a nested resource context
  def link_generator(goal)
    parent_class = goal.goalable.class.to_s
    case parent_class
    when "User"
      html = ""
      html << (link_to [@goalable], class: "btn btn-outline-primary" do
              fa_icon("arrow-left")
              end)
      html.html_safe
    when "School"
      html = ""
      html << (link_to [@goalable], class: "btn btn-outline-primary" do
              fa_icon("arrow-left")
              end)
      html.html_safe
    when "UserRegistration"
      html = ""
      html << (link_to [@goalable.registration_klass, @goalable], class: "btn btn-outline-primary" do
              fa_icon("arrow-left")
              end)
      html.html_safe
    when "RegistrationKlass"
      html = ""
      html << (link_to [@goalable.school, @goalable], class: "btn btn-outline-primary" do
              fa_icon("arrow-left")
              end)
      html.html_safe
    end
  end

  # contextualize the goal, i.e. for a user, display Personal etc.
  def show_name_display(goal)
    parent_class = goal.goalable.class.to_s
    case parent_class
    when "User"
      content_tag(:span, "Personal Goal and Action Plans")
    when "School"
      content_tag(:span, "School Goal and Action Plans")
    when "UserRegistration"
      content_tag(:span, "Subject Goal and Action Plans")
    when "RegistrationKlass"
      content_tag(:span, "Class Goal and Action Plans")
    end
  end
end
