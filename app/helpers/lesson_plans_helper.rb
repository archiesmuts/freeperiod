module LessonPlansHelper
  def term_label term
    term_span_generator term
  end
  def custom_radio_label term
    custom_radio_label_generator term
  end

  private
  def term_span_generator term
    case term
    when 'one'
      content_tag(:span, "Term 1", class: 'badge badge-primary')
    when 'two'
      content_tag(:span, "Term 2", class: 'badge badge-secondary')
    when 'three'
      content_tag(:span, "Term 3", class: 'badge badge-success')
    when 'four'
      content_tag(:span, "Term 4", class: 'badge badge-dark')
    end
  end

  def custom_radio_label_generator term
    case term
    when 'one'
      content_tag(:span, "Term 1", class: 'custom-control-description')
    when 'two'
      content_tag(:span, "Term 2", class: 'custom-control-description')
    when 'three'
      content_tag(:span, "Term 3", class: 'custom-control-description')
    when 'four'
      content_tag(:span, "Term 4", class: 'custom-control-description')
    end
  end
end
