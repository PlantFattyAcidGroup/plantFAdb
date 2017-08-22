class BulkUploadsController < ApplicationController
  authorize_resource :class => false
  before_filter :load_validated_data, except: [:index]
  def index
  end
  
  def check_file
    render :index
  end
  
  def process_file
    if @error.empty? || params[:ignore_errors]
      begin
        @klass.transaction do
          @validated_rows[:items].each do |i|
            i.published_at=Time.now
            i.save!
          end
        end
        flash.now[:notice] ='The data has been saved successfully'
      rescue => e
        @error = "#{e}<br/>#{e.backtrace[0..5].join("<br/>")}"
      end
    end
    render :index
  end
  
  def load_validated_data
    begin
      @klass = params[:datatype].constantize
      data = @klass.parse_excel(params[:file].path)
      @validated_rows = @klass.validate_rows(data)
      @message, @error = @klass.validation_to_html(@validated_rows)
    rescue => e
      @error = "#{e}<br/>#{e.backtrace[0..5].join("<br/>")}"
    end
  end
  
end