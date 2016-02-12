json.array!(@growth_areas) do |growth_area|
  json.extract! growth_area, :id, :title
  json.url growth_area_url(growth_area, format: :json)
end
