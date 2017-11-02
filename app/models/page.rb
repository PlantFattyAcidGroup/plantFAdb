# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  content     :text
#

class Page < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  
  include FriendlyId
  friendly_id :title
    
  def self.path name
    page = Page.where(title: name).first
    if page
      return Rails.application.routes.url_helpers.page_path(page)
    else
      return Rails.application.routes.url_helpers.root_path
    end
  end
end
