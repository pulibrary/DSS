# frozen_string_literal: true
class CatalogController < ApplicationController
  include Dss::Catalog
  include Blacklight::Catalog

  configure_blacklight do |config|
    config.bootstrap_version = 4
    ## Class for sending and receiving requests from a search index
    # config.repository_class = Blacklight::Solr::Repository
    #
    ## Class for converting Blacklight's url parameters to into request parameters for the search index
    # config.search_builder_class = ::SearchBuilder
    #
    ## Model that maps search index responses to the blacklight response model
    # config.response_model = Blacklight::Solr::Response

    ## Default parameters to send to solr for all search-like requests. See also SearchBuilder#processed_parameters
    config.default_solr_params = {
      rows: 10
    }

    # solr path which will be added to solr base url before the other solr params.
    #config.solr_path = 'select'

    # items to show per page, each number in the array represent another option to choose from.
    #config.per_page = [10,20,50,100]

    ## Default parameters to send on single-document requests to Solr. These settings are the Blackligt defaults (see SearchHelper#solr_doc_params) or
    ## parameters included in the Blacklight-jetty document requestHandler.
    #
    #config.default_document_solr_params = {
    #  qt: 'document',
    #  ## These are hard-coded in the blacklight 'document' requestHandler
    #  # fl: '*',
    #  # rows: 1,
    #  # q: '{!term f=id v=$id}'
    #}

    # solr field configuration for search results/index views
    config.index.title_field = 'title_display'
    config.index.display_type_field = 'resource_type_s'
    config.index.constraints_component = Dss::ConstraintsComponent

    # solr field configuration for document/show views
    config.show.title_field = 'title_display'
    config.show.display_type_field = 'resource_type_s'

    config.add_results_document_tool(:bookmark, partial: 'bookmark_control', if: :render_bookmarks_control?)

    config.add_show_tools_partial(:bookmark, partial: 'bookmark_control', if: :render_bookmarks_control?)
    config.add_show_tools_partial(:email, callback: :email_action, validator: :validate_email_params)
    config.add_show_tools_partial(:sms, if: :render_sms_action?, callback: :sms_action, validator: :validate_sms_params)
    config.add_show_tools_partial(:citation)

    # solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _displayed_ in a page.
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.
    #
    # :show may be set to false if you don't want the facet to be drawn in the
    # facet bar
    #
    # set :index_range to true if you want the facet pagination view to have facet prefix-based navigation
    #  (useful when user clicks "more" on a large facet and wants to navigate alphabetically across a large set of results)
    # :index_range can be an array or range of prefixes that will be used to create the navigation (note: It is case sensitive when searching values)

    config.add_facet_field 'subject_topic_facet', label: 'Topic', limit: 25, index_range: 'A'..'Z', sort: 'index', collapse: true
    config.add_facet_field 'language_facet', label: 'Language', limit: true
    config.add_facet_field 'lc_1letter_facet', label: 'Call Number'
    config.add_facet_field 'subject_geo_facet', label: 'Country', limit: 10, sort: 'index', collapse: true
    config.add_facet_field 'region_facet', label: 'Region', limit: 10
    config.add_facet_field 'resource_type_s', label: 'Format'
    config.add_facet_field 'subject_era_facet', label: 'Era'

    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    config.add_index_field 'resource_type_s', label: 'Format'
    config.add_index_field 'sample_t', label: 'Sample'
    #config.add_index_field 'title_display', label: 'Title'
    config.add_index_field 'title_vern_display', label: 'Title'
    config.add_index_field 'blurb_t', label: 'Description', helper_method: :html_safe
    config.add_index_field 'author_display', label: 'Author'
    config.add_index_field 'author_vern_display', label: 'Author'
    config.add_index_field 'format', label: 'Format'
    config.add_index_field 'language_facet', label: 'Language'
    config.add_index_field 'published_display', label: 'Published'
    config.add_index_field 'published_vern_display', label: 'Published'
    config.add_index_field 'lc_callnum_display', label: 'Call number'

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    config.add_show_field 'url_s', label: 'URL', helper_method: :link
    config.add_show_field 'blurb_t', label: 'Description', helper_method: :html_safe
    config.add_show_field 'sample_t', label: 'Sample'
    config.add_show_field 'resource_type_s', label: 'Format', link_to_facet: true
    config.add_show_field 'subject_topic_facet', label: 'Topic', link_to_facet: true
    config.add_show_field 'subject_geo_facet', label: 'Country', link_to_facet: true
    config.add_show_field 'region_facet', label: 'Region', link_to_facet: true
    config.add_show_field 'title_display', label: 'Title'
    config.add_show_field 'title_vern_display', label: 'Title'
    config.add_show_field 'subtitle_display', label: 'Subtitle'
    config.add_show_field 'subtitle_vern_display', label: 'Subtitle'
    config.add_show_field 'author_display', label: 'Author'
    config.add_show_field 'author_vern_display', label: 'Author'
    config.add_show_field 'format', label: 'Format'
    config.add_show_field 'url_fulltext_display', label: 'URL'
    config.add_show_field 'url_suppl_display', label: 'More Information'
    config.add_show_field 'language_facet', label: 'Language'
    config.add_show_field 'published_display', label: 'Published'
    config.add_show_field 'published_vern_display', label: 'Published'
    config.add_show_field 'lc_callnum_display', label: 'Call number'
    config.add_show_field 'isbn_t', label: 'ISBN'

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.

    config.add_search_field 'all_fields', label: 'All Fields'


    # Now we see how to over-ride Solr request handler defaults, in this
    # case for a BL "search field", which is really a dismax aggregate
    # of Solr search fields.

    config.add_search_field('title') do |field|
      # solr_parameters hash are sent to Solr as ordinary url query params.
      field.solr_parameters = {
        'spellcheck.dictionary': 'title',
        qf: '${title_qf}',
        pf: '${title_pf}'
      }
    end

    # config.add_search_field('author') do |field|
    #   field.solr_parameters = {
    #    'spellcheck.dictionary' => 'author',
    #     qf: '${author_qf}',
    #     pf: '${author_pf}'
    #   }
    # end

    # Specifying a :qt only to show it's possible, and so our internal automated
    # tests can test it. In this case it's the same as
    # config[:default_solr_parameters][:qt], so isn't actually neccesary.
    config.add_search_field('subject') do |field|
      field.qt = 'search'
      field.solr_parameters = {
        'spellcheck.dictionary': 'subject',
        qf: '${subject_qf}',
        pf: '${subject_pf}'
      }
    end

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    config.add_sort_field 'score desc, title_sort asc', label: 'relevance'
    config.add_sort_field 'title_sort asc', label: 'title'

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5

    # Configuration for autocomplete suggestor
    config.autocomplete_enabled = false
    config.autocomplete_path = 'suggest'

    # navbar partials
    config.navbar.partials.delete(:search_history)
    config.add_nav_action(:bookmark, partial: 'blacklight/nav/bookmark', if: :render_bookmarks_control?)

    config.search_state_fields = config.search_state_fields + [:id, :utf8]
    config.show.document_actions.delete(:citation)
  end
end
