json.array!(@sterols) do |sterol|
  json.extract! sterol, :id, :delta_notation, :cas_number, :sofa_mol_id
  json.url sterol_url(sterol, format: :json)
end
