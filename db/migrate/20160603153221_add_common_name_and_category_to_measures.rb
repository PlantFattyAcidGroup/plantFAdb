class AddCommonNameAndCategoryToMeasures < ActiveRecord::Migration
  def change
    add_column :measures, :common_name, :string
    add_column :measures, :category, :string
    cy = FattyAcid.where("delta_notation like '%cy%'")
    puts "CY: #{cy.count}"
    cy.update_all(category: 'cyclopentene')
    
    cpa = FattyAcid.where("delta_notation like '%cpa%'")
    puts "CPA: #{cpa.count}"
    cpa.update_all(category: 'cyclopropane')
    
    cpe = FattyAcid.where("delta_notation like '%cpe%'")
    puts "CPE: #{cpe.count}"
    cpe.update_all(category: 'cylcopropene')
    
    o = FattyAcid.where("delta_notation like '%O=%'")
    puts "O: #{o.count}"
    o.update_all(category: 'oxo')
    
    ynoic = FattyAcid.where("name like '%ynoic%'")
    puts "YNOIC: #{ynoic.count}"
    ynoic.update_all(category: 'acetylenic')
  end
end