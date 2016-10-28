module ApplicationHelper
  def blurb_format blurb
    blurb.gsub('\\', '')
  end
end
