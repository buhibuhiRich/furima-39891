# class Users::SessionsController < Devise::SessionsController
#   respond_to :html

#   prepend_before_action :require_no_authentication, only: [:new, :create]
#   prepend_before_action :allow_params_authentication!, only: :create
#   prepend_before_action :verify_signed_out_user, only: :destroy
#   prepend_before_action -> { request.env["devise.skip_timeout"] = true }, only: :create

#   before_action :authenticate_user!, except: [:destroy]

#   def create
#     super do |resource|
#       redirect_to new_user_session_path if resource.errors.any?
#     end
#   end

#   def new
#     self.resource = resource_class.new(sign_in_params)
#     clean_up_passwords(resource)
#     yield resource if block_given?
    
#     respond_to do |format|
#       format.html { respond_with(resource, serialize_options(resource)) }
#     end
#   end

#     protected

#   def after_sign_out_path_for(resource_or_scope)
#     authenticated_root_path
#   end
# end
