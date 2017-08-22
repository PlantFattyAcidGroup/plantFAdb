module BulkData
  extend ActiveSupport::Concern
  # Methods for building and validating items in bulk from excel files
  # Class must override ::bulk_columns with hash with (key,value) paires of (file header, attribute) 
  included do
    # has_many examples
  end

  # def example_instance_method
  # #
  # end


  module ClassMethods
    # defined in classes
    def bulk_columns
      {}
    end
    
    def parse_excel(filepath,opts={})
      header = nil
      cols = bulk_columns
      cols['id']=:id
      rows = []
      xlsx = Roo::Spreadsheet.open(filepath)
      xlsx.each_row_streaming(pad_cells: true).each_with_index do |row, row_index|
        next if row.map{|r| r.try(:value).try(:strip)}.compact.reject(&:blank?).empty?
        # skip comments / store header
        unless header
          next unless row[0].try(:value)
          next unless row[0].value.to_s.downcase.strip.gsub('*','').gsub('_',' ').gsub('-',' ')=~/#{cols.keys.join('|')}/
          header = {}
          row.each_with_index {|cell,idx| next unless cell; header[ActionView::Base.full_sanitizer.sanitize(cell.value.to_s.downcase.strip.gsub('*','').gsub('_',' ').gsub('-',' '))] = idx}
          next
        end
        row_data = {}
        cols.each do |column,field|
          row_data[field] = row[header[column]].to_s.strip if header[column] && !row[header[column]].blank?
        end
        rows << row_data unless row_data.empty?
      end
      return rows
    end
  
    def validate_rows(data)
      errors = []
      items = []
      updates = []
      new_items = []
      new_field_counts = Hash.new(0)
      new_item_count = 0
      updated_field_counts = Hash.new(0)
      updated_item_count = 0
      nochange_item_count = 0
      error_field_counts = Hash.new(0)
      error_item_count = 0
      data.each_with_index do |d,idx|
        begin
          # Get the item
          d_id = d[:id]||d['id']
          if d_id
            if(item = self.find(d_id))
              logger.info(d_id)
              item.assign_attributes(d)
            else
              raise "No item with ID #{d_id} found"
            end
          else
            item = self.new(d)
          end
          # Udate counts for each column
          if item.valid? && item.bulk_valid?(items)
            items << item
            if d_id
              if item.changed?
                updated_item_count+=1
                bulk_columns.each do |c,v|
                  updated_field_counts[c]+=1 if item.attribute_changed?(v)
                end
                if updated_item_count <= 15
                  updates << "##{item.id} - #{item.changes.to_s}"
                end
              else
                nochange_item_count+=1
              end
            else
              new_item_count+=1
              new_items << item
              bulk_columns.each do |c,v|
                new_field_counts[c]+=1 unless item.send(v).blank?
              end
            end
          else
            bulk_columns.each do |c,v|
              error_field_counts[c]+=1 unless item.send(v).blank?
            end
            errors << "Item #{idx+1}: #{item.errors.full_messages.to_sentence}"
            error_item_count+=1
          end
        rescue Exception => e
          error_item_count +=1
          errors << "Item #{idx+1}: #{e}"
        end
      end
      return {
              items: items, 
              field_counts: {new: new_field_counts, update: updated_field_counts, error: error_field_counts},
              item_counts: {new: new_item_count, update: updated_item_count, nochange: nochange_item_count, error: error_item_count},
              errors: errors,
              updates: updates,
              inserts: new_items
            }
    end
  
    def validation_to_html(data,opts={})
      cols = bulk_columns.keys
      error_message = ''
      message = "#{data[:items].count} Valid #{name.pluralize} <br/>"
      message += "- New Item: #{data[:item_counts][:new]}<br/>" if data[:item_counts][:new] > 0
      message += "- Updated: #{data[:item_counts][:update]}<br/>" if data[:item_counts][:update] > 0
      message += "- No Change: #{data[:item_counts][:nochange]}<br/>" if data[:item_counts][:nochange] > 0
      message += <<-HTML
        <table class='table'>
          <thead><th></th>#{cols.map{|c| "<th>#{c}</th>"}.join("") }</thead>
      HTML
      
      if data[:item_counts][:new] > 0
          message += "<tr><td>New Item</td>#{cols.map{|c| "<td>#{data[:field_counts][:new][c]}</td>"}.join("") }</tr>"
      end
      if data[:item_counts][:update] > 0
        message += "<tr><td>Updated</td>#{cols.map{|c| "<td>#{data[:field_counts][:update][c]}</td>"}.join("") }</tr>"
      end
      message += '</table>'
      if data[:inserts].length > 0
        message += "Example Inserts:<br/>"
        message += <<-HTML
          <table class='table' style='font-size:8px'>
            <thead>#{cols.map{|c| "<th>#{c}</th>"}.join("") }</thead>
        HTML
          data[:inserts][0..10].each do |new_item|
            message += "<tr>#{cols.map{|c| "<td>#{new_item.send(bulk_columns[c])}</td>"}.join("") }</tr>"
          end
        message += '</table>'
      end
      if data[:updates].length > 0
        message += "Example Updates:<br/>" + data[:updates].join("<br/><br/>")
      end
      if data[:item_counts][:error] > 0
        error_table = <<-HTML
          <table class='table'>
            <thead>#{cols.map{|c| "<th>#{c}</th>"}.join("") }</thead>
            <tr>#{cols.map{|c| "<td>#{data[:field_counts][:error][c]}</td>"}.join("") }</tr>
          </table>
        HTML
        error_message = "#{data[:item_counts][:error]} Errors:<br>" + error_table + data[:errors].join("<br/>")
      end
      return message, error_message
    end
  
    def validation_to_string(data,opts={})
      message = "#{data[:items].count} Valid #{name.pluralize} \n"
      message += "New field counts: #{data[:field_counts][:new].to_s}\n"
      message += "Updated field counts: #{data[:field_counts][:update].to_s}\n"
      message += "No Change: #{data[:item_counts][:nochange]}\n"
      message += "--\nExample Updates:\n #{data[:updates].join("\n")}\n--\n" if data[:item_counts][:update] > 0
      if data[:item_counts][:error] > 0
        message += "--\n#{data[:item_counts][:error]} Errors:\n"
        message += "invalid field counts: #{data[:field_counts][:error].to_s}\n"
        message += data[:errors].join("\n")
      end
      return message
    end
  end
end