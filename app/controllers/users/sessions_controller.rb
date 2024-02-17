# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
  prepend_before_action :require_no_authentication, only: [:new, :create]
  prepend_before_action :allow_params_authentication!, only: :create
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action -> { request.env["devise.skip_timeout"] = true }


  protected

  def after_sign_in_path_for(resource)
    items_path
  end
end

def authenticate_user
  # 何かしらの処理
end
end

