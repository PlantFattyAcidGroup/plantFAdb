# == Schema Information
#
# Table name: dbxrefs
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  link        :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Dbxref < ActiveRecord::Base
  has_many :datasets
  has_paper_trail
  
  def generate_link(val)
    if link.present?
      html = "<a href=#{link}#{val} target='_blank'>#{name}:#{val}</a>".html_safe
    else
      html = name+':'+val
    end
    return html
  end
end
