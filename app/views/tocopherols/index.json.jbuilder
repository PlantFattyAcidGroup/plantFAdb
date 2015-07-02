json.array!(@tocopherols) do |tocopherol|
  json.extract! tocopherol, :id, :delta_notation, :cas_number, :sofa_mol_id
  json.url tocopherol_url(tocopherol, format: :json)
end
