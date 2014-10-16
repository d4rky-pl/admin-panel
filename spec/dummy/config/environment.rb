# Force test environment
ENV['RAILS_ENV'] = 'test'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Dummy::Application.initialize!
