class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction 
  require 'csv'
  
  private
  def render_csv
    set_file_headers
    set_streaming_headers
    response.status = 200
    #setting the body to an enumerator, rails will iterate this enumerator
    self.response_body = Enumerator.new do |y|
      yield y
    end
  end
  
  def set_file_headers
    file_name = "#{resource_name}.csv"
    headers["Content-Type"] = "text/csv"
    headers["Content-disposition"] = "attachment; filename='#{file_name}'"
  end
  
  def set_streaming_headers
    #nginx doc: Setting this to "no" will allow unbuffered responses suitable for Comet and HTTP streaming applications
    headers['X-Accel-Buffering'] = 'no'

    headers["Cache-Control"] ||= "no-cache"
    headers.delete("Content-Length")
  end
  
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end
  def sort_column
    if params[:action] == 'index'
      params[:sort] || "#{table_name}.id"
    else
      # NOTE: this assumes non-index tables always include a 'results' column
      params[:sort] || "results.id"
    end
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
