require 'form_slider/helper'

module FormSlider
  module SliderFormBuilder
    class SliderFormForBuilder < ActionView::Helpers::FormBuilder
      include FormSlider::Helper

      delegate :content_tag, :tag, :concat, :logger, to: :@template
      
      def slider_field(name, *args)
        args = args.any? ? args.first : {}
        value = object.try(name) || args[:min]
        output = ""
        content_tag :div, class: 'slider-container' do
          output << concat( slider_label(name, args) )
          output << concat( content_tag :div, '', slider_options(name, args) )
          output << concat( text_field(name, value: value) )
        end
      end
    end
  end
end
