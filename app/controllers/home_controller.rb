class HomeController < ApplicationController
  skip_authorization_check
  #skip_before_action :authenticate_user!
  def index
    @page = Page.find_by(title: 'home')
  end
end