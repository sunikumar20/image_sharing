class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "admin"
    end
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.present?
      albums_path
    else
      root_path
    end
  end

end