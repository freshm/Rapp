class SessionsController < Devise::SessionsController
	def create
		self.resource = resource_class.new(sign_in_params)
		
		if resource.confirmed?
			self.resource = warden.authenticate!(auth_options)
			set_flash_message(:notice, :signed_in) if is_navigational_format?
			sign_in(resource_name, resource)
			respond_with resource, :location => after_sign_in_path_for(resource)
		else
			flash[:error] = "The admin has not confirmed you yet."
			redirect_to root_path
		end
	end
end