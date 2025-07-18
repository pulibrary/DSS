class TimestampFieldBuilder
  def labelled_datetime_select(object, object_name, template, method, html_options = {})
    labels = %w[Year Month Day Hour Minute]
    result = ""

    # Use the model's timestamp or default to current time
    value = object.send(method) || Time.current

    labels.each_with_index do |label, num|
      method_name = "select_#{label.downcase}"
      result << template.send(
        method_name,
        value,
        { field_name: "#{method}(#{num + 1}i)", prefix: object_name },
        html_options.merge("aria-label" => label)
      )
    end

    # rubocop:disable Rails/OutputSafety
    result.html_safe
    # rubocop:enable Rails/OutputSafety
  end
end
