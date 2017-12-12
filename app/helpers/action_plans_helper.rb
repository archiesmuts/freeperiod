module ActionPlansHelper

  def action_to_do_span(action_plan)
    if action_plan.when_date
      content_tag(:i, "", class: "fa fa-calendar-check-o")
    else
      content_tag(:i, "", class: "fa fa-check-square-o")
    end
  end
end
