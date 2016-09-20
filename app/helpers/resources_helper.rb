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

  # munges urls to get a link to a study
  def study_link(url)
    if study_id = url.match(/studyno=(\d+)$/)
       study = Study.where(studynum: "#{study_id[1]}").take
       binding.pry
       link_to 'view resource', study_path(study)
    else
      link_to 'view resource', url
    end
  end
end
