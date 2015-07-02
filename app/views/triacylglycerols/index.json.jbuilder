json.array!(@triacylglycerols) do |triacylglycerol|
  json.extract! triacylglycerol, :id, :delta_notation, :cas_number, :sofa_mol_id
  json.url triacylglycerol_url(triacylglycerol, format: :json)
end
