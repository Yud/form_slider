ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)

require 'pry'
require 'rails'
require 'nokogiri'
require '../form_slider/lib/form_slider/application_helper_additions'
