json.array!(@parameters) do |parameter|
  json.extract! parameter, :id, :delta_notation, :cas_number, :sofa_mol_id
  json.url parameter_url(parameter, format: :json)
end
