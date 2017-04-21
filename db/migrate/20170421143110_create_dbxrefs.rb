class CreateDbxrefs < ActiveRecord::Migration
  def change
    create_table :dbxrefs do |t|
      t.string :name
      t.string :description
      t.string :link
      t.timestamps
    end
    Dbxref.create(name: "SOFA", description: "Seed oil fatty acids database", link: "http://sofa.mri.bund.de/Show_ResultDetail.php?Tab_ID=")
  end
end
