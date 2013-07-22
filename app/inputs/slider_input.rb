# custom input for formtastic
# can be used like this:
#
# f.input :score, as: :slider, min: 1, max: 5

class SliderInput < Formtastic::Inputs::StringInput
  include FormSlider::Helper
  include ActionView::Helpers
  include ActionView::Context

  def to_html
    value = object[method] || options[:min]
    output = ""
    content_tag :div, class: 'slider-container' do
      output << concat( slider_label(method, options) )
      output << concat( content_tag :div, '', slider_options(method, options) )
      output << concat( builder.text_field(method, value: value) )
    end
  end
end
