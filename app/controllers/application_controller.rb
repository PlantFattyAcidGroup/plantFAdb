class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_draftsman_whodunnit
  helper_method :sort_column, :sort_direction 
  require 'csv'
  check_authorization :unless => :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
    
  private
  
  def render_csv
    set_csv_headers
    set_streaming_headers
    response.status = 200
    #setting the body to an enumerator, rails will iterate this enumerator
    self.response_body = Enumerator.new do |y|
      yield y
    end
  end
  
  def set_csv_headers
    file_name = "#{resource_name}.csv"
    headers["Content-Type"] = "text/csv; charset=utf-8"
    headers["Content-disposition"] = "attachment; filename='#{file_name}'"
  end
  
  def set_streaming_headers
    #nginx doc: Setting this to "no" will allow unbuffered responses suitable for Comet and HTTP streaming applications
    headers['X-Accel-Buffering'] = 'no'

    headers["Cache-Control"] ||= "no-cache"
    headers.delete("Content-Length")
  end
  
  def sort_direction  
    params[:direction]=='desc' ?  params[:direction] : "asc"  
  end
  
  def sort_column
    "#{table_name}.id"
  end
  
  def resource_name
    params[:controller].sub("Controller", "").underscore.split('/').last.singularize
  end
  
  def resource_class
    resource_name.camelize.constantize
  end
  
  def table_name
    resource_class.table_name
  end
end
