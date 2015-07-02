json.array!(@systematic_names) do |systematic_name|
  json.extract! systematic_name, :id, :name
  json.url systematic_name_url(systematic_name, format: :json)
end
