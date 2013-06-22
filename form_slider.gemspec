$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "form_slider/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "form_slider"
  s.version     = FormSlider::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of FormSlider."
  s.description = "TODO: Description of FormSlider."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0.rc2"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'capybara'
  s.add_development_dependency "pry"

  s.add_development_dependency "sqlite3"
end
