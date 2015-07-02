json.array!(@trivial_names) do |trivial_name|
  json.extract! trivial_name, :id, :name
  json.url trivial_name_url(trivial_name, format: :json)
end
