class ApplicationController < ActionController::API

  # Initialize configuration defaults for originally generated Rails version.
	config.load_defaults 5.1

	# Settings in config/environments/* take precedence over those specified here.
	# Application configuration should go into files in config/initializers
	# -- all .rb files in that directory are automatically loaded.

	# Only loads a smaller set of middleware suitable for API only apps.
	# Middleware like session, flash, cookies can be added back manually.
	# Skip views, helpers and assets when generating a new resource.
	config.api_only = true

	config.middleware.insert_before 0, "Rack::Cors" do
		allow do
		origins '*'
		resource(
			'*',
			headers: :any,
			methods: [:get, :patch, :put, :delete, :post, :options]
			)
		end
	end


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
  end
end
