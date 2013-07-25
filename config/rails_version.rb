require "rails"

def dummy_path
  Rails.version.to_i == 3 ? "dummy-3.2" : "dummy"
end
