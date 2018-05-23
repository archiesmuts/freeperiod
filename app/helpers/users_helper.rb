module UsersHelper
  def user_type(user)
    user_roles = user.roles
    case role_name_for_school = user_roles.find { |value| value['resource_type'] == 'School'}['name']
      when "educator"
        "Educator"
      when "learner"
        "Learner"
      when "account_owner"
        "Account Owner"
      when "school_admin"
        "School Admin"
      when "parent_or_guardian"
        "Parent"
      when "friend_of_school"
        "Friend of School"
    end
  end

  def user_tag(user)
    user_roles = user.roles
    case role_name_for_school = user_roles.find { |value| value['resource_type'] == 'School'}['name']
      when "educator"
        content_tag(:span, "Teacher", class: "badge badge-secondary")
      when "learner"
        content_tag(:span, "Learner", class: "badge badge-info")
      when "account_owner"
        content_tag(:span, "Account Owner", class: "badge badge-info")
      when "school_admin"
        content_tag(:span, "School Administrator", class: "badge badge-info")
      when "parent_or_guardian"
        content_tag(:span, "Parent", class: "badge badge-info")
      when "friend_of_school"
        content_tag(:span, "Friend of School", class: "badge badge-info")
    end
  end
end
# content_tag(:span, content_tag(:i, "", class: "fa fa-question"), class: "badge badge-success")
