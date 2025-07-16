class TimestampFormBuilder < ActionView::Helpers::FormBuilder
  def custom_datetime_select(method, options = {}, html_options = {})
    labels = ["Year", "Month", "Day", "Hour", "Minute"]
    result = ""

    # Use the model's timestamp or default to current time
    value = @object.send(method) || Time.current

    # Year
    result << @template.select_year(
      value,
      { field_name: "#{method}(1i)", prefix: @object_name },
      html_options.merge("aria-label" => labels[0])
    )

    # Month
    result << @template.select_month(
      value,
      { field_name: "#{method}(2i)", prefix: @object_name },
      html_options.merge("aria-label" => labels[1])
    )

    # Day
    result << @template.select_day(
      value,
      { field_name: "#{method}(3i)", prefix: @object_name },
      html_options.merge("aria-label" => labels[2])
    )

    # Hour
    result << @template.select_hour(
      value,
      { field_name: "#{method}(4i)", prefix: @object_name },
      html_options.merge("aria-label" => labels[3])
    )

    # Minute
    result << @template.select_minute(
      value,
      { field_name: "#{method}(5i)", prefix: @object_name },
      html_options.merge("aria-label" => labels[4])
    )

    result.html_safe
  end
end
