json.array!(@publications) do |publication|
  json.extract! publication, :id, :year, :authors, :journal, :volume, :page, :remarks, :plant_id
  json.url publication_url(publication, format: :json)
end
