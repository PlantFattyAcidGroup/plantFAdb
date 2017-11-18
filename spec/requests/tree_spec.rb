describe 'Tree', :type => :request do
  let!(:seed_plants) {TreeNode.create name: 'Spermatophyte', note: 'Seed Plants', color: '#E0E0E0'}
  let!(:dill) {seed_plants.children.create name: 'Dilleniales', color: '#FAE7EC'}
  let!(:gymno) {seed_plants.children.create name: 'Gymnosperms', color: '#BE9FE6'}
  let!(:d1) {create(:dataset)}
  let!(:d2) {create(:dataset)}
  let!(:fa1) {create(:fatty_acid, category: 'foo')}
  let!(:fa2) {create(:fatty_acid, category: 'bar')}
  let!(:fa3) {create(:fatty_acid, category: 'bar')}
  let!(:r1) {create(:result, value: '10', measure: fa1, dataset: d1)}
  let!(:r2) {create(:result, value: '15', measure: fa1, dataset: d2)}
  let!(:r3) {create(:result, value: '15', measure: fa2, dataset: d1)}
  let!(:r4) {create(:result, value: '20', measure: fa3, dataset: d2)}
  context 'Data' do
    scenario 'default' do
      get data_tree_index_path
      data = response.body
      expected = [{
        "id"=> "Spermatophyte","name"=> "Spermatophyte","note"=> "Seed Plants","max"=> nil,"avg"=> nil,"count"=> nil,
        "children"=> [{"id"=> "Dilleniales","name"=> "Dilleniales","note"=> nil,
            "max"=>20.0,
            "avg"=> 15.0,
            "count"=> 4,
            "children"=> [],"color"=> "#FAE7EC","taxon"=> ["Dilleniales"]},
          {"id"=> "Gymnosperms","name"=> "Gymnosperms","note"=> nil,"max"=>0.0,"avg"=> 0.0,"count"=> 0,"children"=> [],"color"=> "#BE9FE6","taxon"=> ["Gymnosperms"]}
        ],"color"=>"#E0E0E0","taxon"=>["Spermatophyte"]}].to_json
      expect(data).to eq expected
    end
    scenario 'by measure' do
      get data_tree_index_path(measure_id: fa1.id)
      data = response.body
      expected = [{
        "id"=> "Spermatophyte","name"=> "Spermatophyte","note"=> "Seed Plants","max"=> nil,"avg"=> nil,"count"=> nil,
        "children"=> [{"id"=> "Dilleniales","name"=> "Dilleniales","note"=> nil,
            "max"=>15.0,
            "avg"=> 12.5,
            "count"=> 2,
            "children"=> [],"color"=> "#FAE7EC","taxon"=> ["Dilleniales"]},
          {"id"=> "Gymnosperms","name"=> "Gymnosperms","note"=> nil,"max"=>0.0,"avg"=> 0.0,"count"=> 0,"children"=> [],"color"=> "#BE9FE6","taxon"=> ["Gymnosperms"]}
        ],"color"=>"#E0E0E0","taxon"=>["Spermatophyte"]}].to_json
      expect(data).to eq expected
    end
    scenario 'by category' do
      get data_tree_index_path(category: 'bar')
      data = response.body
      expected = [{
        "id"=> "Spermatophyte","name"=> "Spermatophyte","note"=> "Seed Plants","max"=> nil,"avg"=> nil,"count"=> nil,
        "children"=> [{"id"=> "Dilleniales","name"=> "Dilleniales","note"=> nil,
            "max"=>20.0,
            "avg"=> 17.5,
            "count"=> 2,
            "children"=> [],"color"=> "#FAE7EC","taxon"=> ["Dilleniales"]},
          {"id"=> "Gymnosperms","name"=> "Gymnosperms","note"=> nil,"max"=>0.0,"avg"=> 0.0,"count"=> 0,"children"=> [],"color"=> "#BE9FE6","taxon"=> ["Gymnosperms"]}
        ],"color"=>"#E0E0E0","taxon"=>["Spermatophyte"]}].to_json
      expect(data).to eq expected
    end
  end
  context 'Plant Yield' do
    scenario 'default' do
      get plant_yield_results_path(taxon: 'Dilleniales')
      data = response.body
      expected = [{
        "id"=>"Dilleniaceae","name"=>"Dilleniaceae","common_name"=>"Dilleniaceae",
        "max"=>20.0,"avg"=>15.0,"count"=>4,"taxon"=>["Dilleniales","Dilleniaceae"]
      }].to_json
      expect(data).to eq expected
    end
    scenario 'by category' do
      get plant_yield_results_path(taxon: 'Dilleniales',category: 'bar')
      data = response.body
      expected = [{
        "id"=>"Dilleniaceae","name"=>"Dilleniaceae","common_name"=>"Dilleniaceae",
        "max"=>20.0,"avg"=>17.5,"count"=>2,"taxon"=>["Dilleniales","Dilleniaceae"]
      }].to_json
      expect(data).to eq expected
    end
    scenario 'by measure' do
      get plant_yield_results_path(taxon: 'Dilleniales',measure_id:fa1.id)
      data = response.body
      expected = [{
        "id"=>"Dilleniaceae","name"=>"Dilleniaceae","common_name"=>"Dilleniaceae",
        "max"=>15.0,"avg"=>12.5,"count"=>2,"taxon"=>["Dilleniales","Dilleniaceae"]
      }].to_json
      expect(data).to eq expected
    end
    scenario 'grouped' do
      get plant_yield_results_path(taxon: 'Dilleniales,Dilleniaceae')
      data = response.body
      expected = [{
        "id"=>["Dillenia",d1.species],"name"=>"Dillenia #{d1.species}","common_name"=>["Dillenia",d1.species],
        "max"=>15.0,"avg"=>12.5,"count"=>2,"taxon"=>["Dilleniales","Dilleniaceae",["Dillenia",d1.species]]
        },{
        "id"=>["Dillenia",d2.species],"name"=>"Dillenia #{d2.species}","common_name"=>["Dillenia",d2.species],
        "max"=>20.0,"avg"=>17.5,"count"=>2,"taxon"=>["Dilleniales","Dilleniaceae",["Dillenia",d2.species]
      ]}].to_json
      expect(data).to eq expected
    end
  end
end