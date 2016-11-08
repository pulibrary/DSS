class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout 'application'

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if !request.env['omniauth.origin'].nil?
      request.env['omniauth.origin']
    else
      root_path
    end
  end
end
