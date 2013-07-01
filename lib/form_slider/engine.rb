require "rubygems"
require "jquery-rails"
require "jquery-ui-rails"
require "coffee-rails"

module FormSlider
  class Engine < ::Rails::Engine
    initializer 'form_slider.initialize' do
      config.to_prepare do
        ActiveSupport.on_load(:action_view) do
          include FormSlider::ApplicationHelperAdditions
        end
      end
    end
  end
end
