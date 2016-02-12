json.array!(@stages) do |stage|
  json.extract! stage, :id, :title
  json.url stage_url(stage, format: :json)
end
