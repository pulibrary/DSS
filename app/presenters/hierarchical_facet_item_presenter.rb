# This class is responsible for rendering values for the "constraints"
# (the breadcrumb-like display on the search results page)
class HierarchicalFacetItemPresenter < Blacklight::FacetItemPresenter
  def label = super.gsub('|||', ' / ')
end
