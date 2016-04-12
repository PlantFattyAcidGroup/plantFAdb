class SofaTab < ActiveRecord::Base
  belongs_to :pub
  
  def sofa_url
    "http://sofa.mri.bund.de/Show_ResultDetail.php?Tab_ID="+(sofa_tab_id||'')
  end
end