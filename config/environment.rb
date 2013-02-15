# Load the rails application
require File.expand_path('../application', __FILE__)


require_relative '../lib/api'

# Initialize the rails application
Blockparty::Application.initialize!
