module StudiesHelper
  def build_file_path(folder_num, file_name = nil)
    data_base_path = "http://dss2.princeton.edu/data/"
    if file_name.nil?
      link_to "See all included Files", "#{data_base_path}#{folder_num}"
    else
      link_to file_name, "#{data_base_path}#{folder_num}/#{file_name}"
    end
  end

  def catalog_path(id)
    link_to id, "https://catalog.princeton.edu/catalog/#{id}"
  end

  def file_label(data_file)
    if data_file.files.nil?
      "Directory Listing"
    else
      data_file.files
    end
  end
end
