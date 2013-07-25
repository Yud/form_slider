ENV["RAILS_ENV"] ||= 'test'

require 'pry'
require 'rails'
require 'nokogiri'
require './config/rails_version'

require File.expand_path("../#{dummy_path}/config/environment", __FILE__)

require '../form_slider/lib/form_slider/application_helper_additions'
