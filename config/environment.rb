# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Depot::Application.initialize!

Depot::Application.configure do
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
		address: "willmannie@gmail.com",
		port: 587,
		domain: "domain.of.sender.net",
		authentication: "plain",
		user_name: "raleigh",
		password: "fatoki",
		enable_starttls_auto: true
	}
end
