module CountriesHelper
  # Mostly borrowed from Rails 7.0.4.2 #options_from_collection_for_select
  def countries_for_select(collection, value_method, text_method, selected = nil)
    options = collection.map do |element|
      [value_for_collection(element, text_method), value_for_collection(element, value_method), option_html_attributes(element)]
    end
    # Begin custom section
    select_all_option = ['All Countries', 'all', {}]
    options.prepend(select_all_option)
    # End custom section
    selected, disabled = extract_selected_and_disabled(selected)
    select_deselect = {
      selected: extract_values_from_collection(collection, value_method, selected),
      disabled: extract_values_from_collection(collection, value_method, disabled)
    }

    options_for_select(options, select_deselect)
  end
end
