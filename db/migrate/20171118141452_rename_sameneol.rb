class RenameSameneol < ActiveRecord::Migration
  def change
    Dataset.all.where("upper(datasets.remarks) = ?","SAMENOEL").each_with_index do |dataset,idx|
      puts idx if idx%100==0
      dataset.tissue = 'Seed'
      dataset.remarks.gsub!(/samenoel/i, 'seed tissue')
      dataset.save
    end
  end
end
