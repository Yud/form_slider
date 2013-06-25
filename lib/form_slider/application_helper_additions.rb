require 'form_slider/slider_form_builder'
require 'form_slider/slider_field_tag'

module FormSlider
  module ApplicationHelperAdditions

    include FormSlider::SliderFormBuilder
    include FormSlider::SliderFieldTag

    def slider_form_for(object, options = {}, &block)
      options[:builder] = SliderFormForBuilder
      form_for(object, options, &block)
    end

  end
end
