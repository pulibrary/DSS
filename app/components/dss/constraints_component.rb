module Dss
  class ConstraintsComponent < Blacklight::ConstraintsComponent
    attr_accessor :classes

    # rubocop:disable Metrics/ParameterLists
    def initialize(search_state:,
                   tag: :div,
                   render_headers: true,
                   id: 'appliedParams', classes: 'clearfix constraints-container m-3',
                   query_constraint_component: Blacklight::ConstraintLayoutComponent,
                   query_constraint_component_options: {},
                   facet_constraint_component: Blacklight::ConstraintComponent,
                   facet_constraint_component_options: {},
                   start_over_component: Blacklight::StartOverButtonComponent)
      super
    end
    # rubocop:enable Metrics/ParameterLists
  end
end
