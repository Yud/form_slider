begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'FormSlider'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

rails_version = ENV["FS_RAILS_VERSION"] || "3.2"

if rails_version.to_i == 3
  APP_RAKEFILE = File.expand_path("../spec/dummy-3.2/Rakefile", __FILE__)
else
  APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
end

load 'rails/tasks/engine.rake'



Bundler::GemHelper.install_tasks

