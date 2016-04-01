class Page < ActiveRecord::Base
  include FriendlyId
  friendly_id :title
    
  def self.path name
    page = Page.find_by(title:name)
    if page
      return Rails.application.routes.url_helpers.page_path(page)
    else
      return Rails.application.routes.url_helpers.root_path
    end
  end
end
