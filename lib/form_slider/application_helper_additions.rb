require 'form_slider/slider_form_builder'

module FormSlider
  module ApplicationHelperAdditions
    include SliderFormBuilder

    def slider_form_for(object, options = {}, &block)
      options[:builder] = SliderFormForBuilder
      form_for(object, options, &block)
    end

    def slider_input_tag(name, value=nil, *args)
      args = args.any? ? args.first : {}
      args[:label] ||= name
      args[:min] ||= 1
      args[:max] ||= 10
      args[:color] ||= 'green'
      value = args[:min] if value.blank?
      output = ""
      content_tag :div, class: 'slider-container' do
        output << concat(content_tag :label, args[:label])
        output << concat(content_tag :div, '', class: 'slider', 'data-max' => args[:max], 'data-min' => args[:min], 'data-color' => args[:color])
        output << concat(text_field_tag(name, value))
      end
    end
  end
end
