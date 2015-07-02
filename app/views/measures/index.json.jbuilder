json.array!(@measures) do |measure|
  json.extract! measure, :id, :type, :delta_notation, :cas_number, :sofa_mol_id
  json.url measure_url(measure, format: :json)
end
