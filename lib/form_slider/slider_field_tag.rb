require 'form_slider/helper'

module FormSlider
  module SliderFieldTag
    include FormSlider::Helper

    def slider_field_tag(name, value=nil, *args)
      args = args.any? ? args.first : {}
      value = args[:min] if value.blank?
      output = ""
      content_tag :div, class: 'slider-container' do
        output << concat( slider_label(name, args) )
        output << concat( content_tag :div, '', slider_options(name, args) )
        output << concat( text_field_tag(name, value) )
      end
    end
  end
end
