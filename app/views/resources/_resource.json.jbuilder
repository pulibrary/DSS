json.extract! resource, :id, :name, :resource_id, :url, :blurb, :link_time, :sample, :principal_investigator, :producer, :distributor, :version, :more_detail_url, :resource_type, :created_at, :updated_at
json.url resource_url(resource, format: :json)
