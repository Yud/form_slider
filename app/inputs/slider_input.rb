# custom input for formtastic
# can be used like this:
#
# f.input :score, as: :slider, min: 1, max: 5

class SliderInput < Formtastic::Inputs::StringInput
  include FormSlider::Helper
  include ActionView::Helpers
  include ActionView::Context

  def to_html
    value = object.send(method) || options[:min]
    label = slider_label(method, options)
    slider = content_tag :div, '', slider_options(method, options)
    output = builder.input(method, input_options.merge(input_html: { value: value }, wrapper_html: { class: "slider-container" }))
    output.gsub! /(<label).*(<\/label>)/, label
    output.insert output.index(/(<input)/), slider
    output.html_safe
  end
end
