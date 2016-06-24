class SofaTab < ActiveRecord::Base
  belongs_to :pub
  
  def self.sofa_url(tab_id)
    "http://sofa.mri.bund.de/Show_ResultDetail.php?Tab_ID="+(tab_id||'')
  end
  def sofa_url
    SofaTab.sofa_url(sofa_tab_id)
  end
end