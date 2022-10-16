# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  after_action :set_default_address

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    user = User.from_omniauth(auth)

    if User.find_by(email: user.email).provider == nil
      redirect_to sign_in_path, notice: "Email already exists. Try signing in using your email."
    else
      if user.present?  
        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] = 
        t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
        redirect_to new_user_session_path
      end
    end
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def set_default_address
    if current_user
      if !current_user.address
        address = current_user.build_address(street: "", barangay: "", city:"", postal_code:"", country: "Philippines", phone_number:"")
        address.save
      end
    end
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
