module ApplicationHelper
  def blurb_format blurb
    blurb.delete('\\')
  end

  def admin_user?
    if current_or_guest_user.role == 'admin'
      return true
    else
      return false
    end
  end

  # All screens handled by the catalog controller are public screens
  # All other screens are considered "admin" screens
  def admin_screen?
    controller_name != 'catalog'
  end

  # rubocop:disable  Rails/OutputSafety
  def html_safe(args)
    args[:document][args[:field]].join('').gsub("\\'", '').html_safe
  end
  # rubocop:enable  Rails/OutputSafety

  def link(args)
    study_link_array args[:document][args[:field]], args[:document][args[:field]]
  end

  # rubocop:disable  Rails/OutputSafety
  def resource_id(catalog_id)
    catalog_id.gsub("resource", '').html_safe
  end
  # rubocop:enable  Rails/OutputSafety

  # munges urls to get a link to a study
  def study_link_array(label, url)
    if study_id = url.first.match(/studyno=(\d+)$/)
      study = Study.find_by(studynum: (study_id[1]).to_s)
      unless study.nil?
        link_to('View Data Files', study_path(study))
      end
    else
      link_to label.first, url.first
    end
  end

  def study_link(label, url)
    if study_id = url&.match(/studyno=(\d+)$/)
      study = Study.find_by(studynum: (study_id[1]).to_s)
      unless study.nil?
        link_to('View Data Files', study_path(study))
      end
    else
      link_to label, url
    end
  end

  def format_types
    ['Single study',
     'Data archive or collection',
     'Macrodata source',
     'Series - completed',
     'Series - ongoing']
  end
end
