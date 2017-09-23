module MembershipsHelper
  def user_status(membership)
    if current_user.has_role?(:account_owner, membership.school) || membership.user.invitation_accepted?
      content_tag(:span, content_tag(:i, "", class: "fa fa-check"), class: "badge badge-success")
    else
      content_tag(:span, content_tag(:i, "", class: "fa fa-question"), class: "badge badge-warning")
    end
  end
end
