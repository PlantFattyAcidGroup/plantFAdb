class BulkUploadsController < ApplicationController
  authorize_resource :class => false
  def index
  end
  
  def check_file
    begin
    # csv_data = CSV.open(params[:file].path,{ return_headers: true,
    #                                  headers: true,
    #                                  skip_lines: /^#/,
    #                                  skip_blanks: true}).read
    xlsx = Roo::Spreadsheet.open(params[:file].path)
    
    @error, @message = params[:datatype].constantize.check_bulk_data(xlsx)
    
    rescue => e
      @error = "#{e}<br/>#{e.backtrace[0..5].join("<br/>")}"
    end
    render :index
              
  end
  
  def process_file
  end
  
end