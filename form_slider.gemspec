$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "form_slider/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "form_slider"
  s.version     = FormSlider::VERSION
  s.authors     = ["Izhar Gavish"]
  s.email       = ["izharg@gmail.com"]
  s.homepage    = "https://github.com/Yud/form_slider"
  s.summary     = "jQuery UI Slider + Ruby on Rails Forms"
  s.description = "form_slider enables easy integration of jQuery UI Slider within Rails forms, by adding special form helpers"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'coffee-rails', '~> 4.0.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "pry"

  s.add_development_dependency "sqlite3"
end
