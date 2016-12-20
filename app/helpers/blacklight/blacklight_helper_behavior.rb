module Blacklight::BlacklightHelperBehavior
  include BlacklightUrlHelper
  include BlacklightConfigurationHelper
  include HashAsHiddenFieldsHelper
  include RenderConstraintsHelper
  include RenderPartialsHelper
  include FacetsHelper
  extend Deprecation
  self.deprecation_horizon = 'Blacklight version 7.0.0'

  ##
  # Render the search navbar
  # @return [String]
  def render_search_bar
    render :partial=>'pul-assets/blacklight/catalog/search_form'
  end
end
