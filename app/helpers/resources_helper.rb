module ResourcesHelper
  # accepts an array of subject IDs
  def subject_list(subjects)
    subjects = Subject.find(subjects).sort_by{ |subject| subject.name }
    content_tag(:ul, class: "term-list") do
      subjects.each do |subject|
        concat content_tag(:li, subject.name, class: "term")
      end
    end
  end

  # accepts an array of country ids
  def country_list(countries)
    countries = Country.find(countries).sort_by{ |country| country.name }
    content_tag(:ul, class: "term-list") do
      countries.each do |country|
        concat content_tag(:li, country.name, class: "term")
      end
    end
  end

  # accepts an array of country ids
  def region_list(regions)
    regions = Region.find(regions).sort_by{ |region| region.name }
    content_tag(:ul, class: "term-list") do
      regions.each do |region|
        concat content_tag(:li, region.name, class: "term")
      end
    end
  end
end
