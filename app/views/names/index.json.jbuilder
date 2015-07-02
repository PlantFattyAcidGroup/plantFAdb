json.array!(@names) do |name|
  json.extract! name, :id, :type, :name, :measure_id
  json.url name_url(name, format: :json)
end
