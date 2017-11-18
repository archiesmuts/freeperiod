module GoalsHelper
  # TODO Include links in helper file
  # link generator for back button @goalable in a nested resource context
  def link_generator(goal)
    parent_class = goal.goalable.class
    case
    when User
      html = ""
      html += link_to "Back", [@goalable]
      html.html_safe
    when School
      html = ""
      html += link_to "Back", [@goalable]
      html.html_safe
    when UserRegistration
      html = ""
      html += link_to "Back", [@goalable.registration_klass, @goalable]
      html.html_safe
    when RegistrationKlass
      html = ""
      html += link_to "Back", [@goalable.school, @goalable]
      html.html_safe
    end
  end
end
