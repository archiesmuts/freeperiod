module ActionPlansHelper

  def action_to_do_span(action_plan)
    if action_plan.when_date
      content_tag(:span, "A", class: "badge badge-success")
    else
      content_tag(:span, "T", class: "badge badge-info")
    end
  end
end
