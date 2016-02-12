json.array!(@resources) do |resource|
  json.extract! resource, :id, :title, :format, :source, :length
  json.url resource_url(resource, format: :json)
end
