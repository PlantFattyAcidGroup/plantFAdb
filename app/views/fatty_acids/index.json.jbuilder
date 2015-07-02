json.array!(@fatty_acids) do |fatty_acid|
  json.extract! fatty_acid, :id, :type, :delta_notation, :cas_number, :sofa_mol_id
  json.url fatty_acid_url(fatty_acid, format: :json)
end
