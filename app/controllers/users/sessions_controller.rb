class Users::SessionsController < Devise::SessionsController


# before_filter :configure_sign_in_params, only: [:create]

  # GET /users/sign_up
  # def new

  #   # Override Devise default behaviour and create a profile as well
  #   build_resource({})
  #   resource.build_business
  #   respond_with self.resource
  # end


  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end


