module FormSlider
  module SliderFormBuilder
    class SliderFormForBuilder < ActionView::Helpers::FormBuilder
      delegate :content_tag, :tag, :concat, :logger, to: :@template
      
      def slider_field(name, *args)
        args = args.any? ? args.first : {}
        args[:label] ||= name
        args[:min] ||= 1
        args[:max] ||= 10
        args[:color] ||= 'green'
        args[:value] = object.try(name) || args[:min]
        output = ""
        content_tag :div, class: 'slider-container' do
          output << concat(content_tag :label, args[:label])
          output << concat(content_tag :div, '', class: 'slider', 'data-max' => args[:max], 'data-min' => args[:min], 'data-color' => args[:color])
          output << concat(text_field(name, value: args[:value]))
        end
      end
    end
  end
end
