module UsersHelper
  def user_type(user)
    user_roles = user.roles
    case role_name_for_school = user_roles.find { |value| value['resource_type'] == 'School'}['name']
      when "educator"
        content_tag(:span, "Teacher", class: "badge badge-secondary")
      when "learner"
        content_tag(:span, "Learner", class: "badge badge-info")
    end
  end
end
# content_tag(:span, content_tag(:i, "", class: "fa fa-question"), class: "badge badge-success")
