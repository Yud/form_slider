module FormSlider
  module Helper
    def slider_label(name, args)
      name = args[:label][:name] if args[:label] && args[:label][:name] 
      name = name.to_s.humanize unless name.instance_of?(String)
      output = ""
      content_tag :label do
        output << concat(name + ' ')
        output << concat(content_tag(:span, '', class: 'val'))
      end
    end

    def slider_options(args)
      options = { class: 'slider' }
      options['data-append'] = args[:label] && args[:label][:append] ? args[:label][:append] : ''
      options['data-min'] = args[:min] || 1
      options['data-max'] = args[:max] || 10
      options['data-color'] = args[:color] || 'green'
      options
    end
  end
end
