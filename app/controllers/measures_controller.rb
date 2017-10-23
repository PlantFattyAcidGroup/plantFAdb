class MeasuresController < ApplicationController
  skip_authorization_check
  def autocomplete_measure_name
    q = UnicodeUtils.upcase(params[:term]||'')
    measures = Measure.where('
      upper(name) like ?
      OR upper(other_names) LIKE ?
      OR upper(delta_notation) LIKE ?
      OR upper(cas_number) LIKE ?
      OR upper(sofa_mol_id) LIKE ?
      OR upper(lipidmap_id) LIKE ?
      OR upper(common_name) LIKE ?',
      "#{q}%","%#{q}%","#{q}%","#{q}%","#{q}%", "#{q}%", "%#{q}%"
    )
    .order('name').limit(15)
    render :json => measures.map { |m| {:id => m.id, :label => m.display_name, :value => m.display_name} }
  end
end
