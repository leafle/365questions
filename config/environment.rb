# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Default Mailer Host
Rails.application.routes.default_url_options[:host] = '7johnson.com'
