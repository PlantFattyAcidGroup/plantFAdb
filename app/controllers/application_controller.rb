class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction 
  
  private
  def sort_direction  
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end
  def sort_column
    if params[:action] == 'index'
      params[:sort] || "#{table_name}.id"
    else
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
