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
    link_to args[:document][args[:field]], args[:document][args[:field]]
  end

end
