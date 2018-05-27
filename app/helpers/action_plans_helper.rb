module ActionPlansHelper

  def action_to_do_span(action_plan)
    if action_plan.when_date
      content_tag(:i, "", class: "far fa-calendar-check")
    else
      content_tag(:i, "", class: "far fa-check-square")
    end
  end
end
