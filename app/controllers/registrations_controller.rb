# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  # GET /resource/sign_up
  def new
    # ログインしている場合はログアウトしてから新規登録画面にリダイレクト
    if user_signed_in?
      sign_out(current_user)
      redirect_to new_user_registration_path
    else
      super
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :date_of_birth])
  end
end
