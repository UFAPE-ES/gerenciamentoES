class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    attributes = [:nome,:tipo]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Por favor, logue como funcionario para acessar"
      redirect_to new_user_session_path
    end
  end

  def logged?
    !current_admin.nil? || !current_admin.nil?
  end

  # Confirms a logged-in admin.
  def logged_in_admin
    unless logged?
      flash[:danger] = "Por favor, logue como administrador para acessar"
      redirect_to new_admin_session_path
    end
  end

  def logado
    !current_admin.nil? || !current_user.nil?
  end

  def logged_in
    unless logado
      flash[:danger] = "Por favor, logue como funcionario para acessar"
      redirect_to new_user_session_path
    end
  end
end
