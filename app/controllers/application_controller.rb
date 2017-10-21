class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # saves the location before loading each page so we can return to the
  # right page. If we're on a devise page, we don't want to store that as the
  # place to return to (for example, we don't want to return to the sign in page
  # after signing in), which is what the :unless prevents
  before_action :store_current_location, :unless => :devise_controller?

  private
  #
  # def current_account
  #   @current_account ||= School.friendly.find_by(name: request.name)
  # end
  # helper_method :current_account
    # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  # def after_sign_up_path_for(resource)
  #   user_path(resource)
  # end

  def after_invite_path_for(resource)
    school_memberships_path(resource)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :slug, :terms_of_privacy_statement])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :slug])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:email, :slug, :first_name, :last_name])
  end
end
