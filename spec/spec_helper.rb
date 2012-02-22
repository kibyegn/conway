require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra'
require 'rspec'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require File.expand_path("../../conway", __FILE__)
require File.expand_path("../../lib/cell", __FILE__)

RSpec.configure { |config| config.color_enabled = true }
