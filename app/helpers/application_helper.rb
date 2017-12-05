module ApplicationHelper
  def blurb_format blurb
    blurb.gsub('\\', '')
  end

  def admin_user?
    if current_or_guest_user.role == 'admin'
      return true
    else
      return false
    end
  end

  def html_safe(args)
    args[:document][args[:field]].join('').gsub("\\'", '').html_safe
  end

  def link(args)
    study_link args[:document][args[:field]], args[:document][args[:field]]
  end

  def resource_id(catalog_id)
    catalog_id.gsub("resource", '').html_safe
  end

  # munges urls to get a link to a study
  def study_link(label, url)
    if study_id = url.first.match(/studyno=(\d+)$/)
      study = Study.where(studynum: "#{study_id[1]}").take
      unless study.nil?
        link_to('View Data Files', study_path(study))
      end
    else
      link_to label, url.first
    end
  end

  def format_types
    ['Archive or collection of studies',
     'Data archive or collection',
     'Macrodata source',
     'Series - completed',
     'Series - ongoing',
     'Single study']
  end
end
