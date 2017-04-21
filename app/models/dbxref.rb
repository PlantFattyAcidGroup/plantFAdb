class Dbxref < ActiveRecord::Base
  has_many :datasets
  has_paper_trail
  
  def generate_link(val)
    if link.present?
      html = "<a href=#{link} target='_blank'>#{val}</a>".html_safe
    else
      html = val
    end
    return html
  end
end
