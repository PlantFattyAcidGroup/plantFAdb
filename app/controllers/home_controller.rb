class HomeController < ApplicationController
  skip_authorization_check
  def index
    @page = Page.find_by(title: 'home')
  end
end