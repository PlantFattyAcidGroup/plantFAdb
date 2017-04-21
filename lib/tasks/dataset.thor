class Dataset < Thor
  ENV['RAILS_ENV'] ||= 'development'
  
  desc 'transfer_results', "reorganize result data into datasets"
  def transfer_results
    require File.expand_path("#{File.expand_path File.dirname(__FILE__)}/../../config/environment.rb")
    ::Result.transaction do
      pbar = ProgressBar.new(PlantsPub.count)
      sofa_id = Dbxref.find_by(name: 'SOFA').id
      ::PlantsPub.includes(results: [:publication]).find_each do |pb|
        pb.results.group_by(&:sofa_tab_id).each do |tab,results|
          d = ::Dataset.create_with(remarks: results.first.publication.try(:remarks), lipid_measure: 'unknown', dbxref_id: (tab.blank? ? nil : sofa_id))
                     .find_or_create_by(plants_pub_id: pb.id, dbxref_value: tab)
          ::Result.where(id: results.map(&:id)).update_all(dataset_id: d.id)
        end
        pbar.increment!
      end
    end
  end
end