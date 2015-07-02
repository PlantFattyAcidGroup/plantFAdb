json.array!(@results) do |result|
  json.extract! result, :id, :value, :unit, :measure_id, :publication_id
  json.url result_url(result, format: :json)
end
