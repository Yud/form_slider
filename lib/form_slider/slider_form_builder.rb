module FormSlider
  module SliderFormBuilder
    class SliderFormForBuilder < ActionView::Helpers::FormBuilder
      delegate :content_tag, :tag, :concat, :logger, to: :@template
      
      def slider_field(name, *args)
        args = args.any? ? args.first : {}
        args[:label_name] = args[:label] && args[:label][:name] ? args[:label][:name] : name.to_s
        args[:label_append] = args[:label] && args[:label][:append] ? args[:label][:append] : ''
        args[:min] ||= 1
        args[:max] ||= 10
        args[:color] ||= 'green'
        args[:value] = object.try(name) || args[:min]
        output = ""
        content_tag :div, class: 'slider-container' do
          output << concat(slider_label(args[:label_name], args[:label_append]))
          output << concat(content_tag :div, '', class: 'slider', 'data-max' => args[:max], 'data-min' => args[:min], 'data-color' => args[:color], 'data-append' => args[:append])
          output << concat(text_field(name, value: args[:value]))
        end
      end

      def slider_label(name, append)
        output = ""
        content_tag :label do
          output << concat(name+' ')
          output << concat(content_tag(:span, '', class: 'val'))
          output << concat(append)
        end
      end
    end
  end
end
