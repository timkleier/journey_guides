json.array!(@frameworks) do |framework|
  json.extract! framework, :id, :title
  json.url framework_url(framework, format: :json)
end
