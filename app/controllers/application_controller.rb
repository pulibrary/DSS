class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

  protect_from_forgery with: :exception
  before_action :authenticate_user!

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
end
