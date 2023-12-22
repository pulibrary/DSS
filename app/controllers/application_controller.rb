class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if params[:origin]
      request.flash.delete('alert')
      request.flash.keep('notice')
      params[:origin].chomp('/email')
    elsif !request.env['omniauth.origin'].nil?
      request.env['omniauth.origin']
    else
      root_path
    end
  end

  def determine_layout
    'application'
  end

  def require_admin_login
    head :forbidden unless admin_user?
  end

  def admin_user?
    current_or_guest_user.role == 'admin'
  end
end
