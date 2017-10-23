# Use bundler to load gems
require 'bundler'

# Load gems from Gemfile
Bundler.require()

# Load settings for the production/development environment
require_relative 'config/environment'

# Start the application
run App
