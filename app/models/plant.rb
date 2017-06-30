class Plant < ActiveRecord::Base
  has_many :publications, dependent: :destroy
  has_many :plants_pubs, dependent: :destroy
  has_many :pubs, through: :plants_pubs
  has_many :results, through: :plants_pubs
  validates :order_name, presence: true
  validates :family, presence: true
  validates :genus, presence: true
  validates :species, presence: true
  
  has_paper_trail
  has_drafts
  def display_name
    if genus.blank? && species.blank?
      family || order_name || sofa_family || sofa_name || 'Unknown Plant'
    else
      "#{genus} #{species}"
    end
  end
  
  def detailed_name
    "#{id}: #{display_name} #{variety.present? ? ('(var. '+variety+')') : ''} - #{common_name} -- #{sofa_name}"
  end
  
  
  def self.bulk_columns
    {
      "common name" => :common_name,
      "name status" => :name_status,
      "matched rank" => :matched_rank,
      "order" => :order_name,
      "family" => :family,
      "genus" => :genus,
      "species" => :species,
      "variety" => :variety,
      "tissue" => :tissue,
      "tropicos url" => :tropicos_url,
      "tnrs name" => :tnrs_name,
      "tnrs family" => :tnrs_family,
      "tnrs match" => :tnrs_match,
      "accepted rank" => :accepted_rank,
      "note" => :note
    }
  end
  
  def self.parse_excel(filepath,opts={})
    header = nil
    cols = bulk_columns
    rows = []
    xlsx = Roo::Spreadsheet.open(filepath)
    xlsx.each_row_streaming(pad_cells: true).each_with_index do |row, row_index|
      next if row.map{|r| r.try(:value).try(:strip)}.compact.reject(&:blank?).empty?
      # skip comments / store header
      unless header
        next unless row[0].try(:value)
        next unless row[0].value.downcase.strip.gsub('*','')=~/#{bulk_columns.keys.join('|')}/
        header = {}
        row.each_with_index {|cell,idx| next unless cell; header[ActionView::Base.full_sanitizer.sanitize(cell.value.downcase.strip.gsub('*',''))] = idx}
        next
      end
      row_data = {}
      bulk_columns.each do |column,field|
        row_data[field] = row[header[column]] if header[column] && !row[header[column]].blank?
      end
      rows << row_data unless row_data.empty?
    end
    return rows
  end
  
  def self.validate_rows(data)
    error_count = 0
    errors = []
    items = []
    counts = {}
    error_counts = {}
    bulk_columns.each{|c,v| counts[c]=0}
    bulk_columns.each{|c,v| error_counts[c]=0}
    data.each_with_index do |d,idx|
      begin
        item = self.new(d)
        if item.valid?
          items << item
          bulk_columns.each do |c,v|
            counts[c]+=1 unless item.send(v).blank?
          end
        else
          error_count +=1
          bulk_columns.each do |c,v|
            error_counts[c]+=1 unless item.send(v).blank?
          end
          errors << "Item #{idx+1}: #{item.errors.full_messages.to_sentence}"
        end
      rescue Exception => e
        error_count +=1
        errors << "Item #{idx+1}: #{e}"
      end
    end
    return {items: items, field_counts: {valid: counts, invalid: error_counts}, error_count: error_count, errors: errors}
  end
  
  def self.validation_to_html(data,opts={})
    cols = bulk_columns.keys
    error_message = ''
    message = "Valid #{name.pluralize}: #{data[:items].count}<br/>"
    message += <<-HTML
      <table class='table'>
        <thead>#{cols.map{|c| "<th>#{c}</th>"}.join("") }</thead>
        <tr>#{cols.map{|c| "<td>#{data[:field_counts][:valid][c]}</td>"}.join("") }</tr>
      </table>
    HTML
    if data[:error_count] > 0
      error_table = <<-HTML
        <table class='table'>
          <thead>#{cols.map{|c| "<th>#{c}</th>"}.join("") }</thead>
          <tr>#{cols.map{|c| "<td>#{data[:field_counts][:invalid][c]}</td>"}.join("") }</tr>
        </table>
      HTML
      error_message = "#{data[:error_count]} Errors:<br>" + error_table + data[:errors].join("<br/>")
    end
    return message, error_message
  end
  
  def self.validation_to_string(data,opts={})
    message = "Valid #{name.pluralize}: #{data[:items].count}\n"
    message += "valid field counts: #{data[:field_counts][:valid].to_s}\n"
    if data[:error_count] > 0
      message += "--\n#{data[:error_count]} Errors:\n"
      message += "invalid field counts: #{data[:field_counts][:invalid].to_s}\n"
      message += data[:errors].join("\n")
    end
    return message
  end
end
