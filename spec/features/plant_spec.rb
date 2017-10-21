feature 'Plant' do
  background do
    user = create(:user)
    sign_in_as(user)
  end
  
  describe 'Listing' do
    let!(:plant) {create(:plant, :with_data)}
    
    background do
      click_link 'Plants'
    end
    
    scenario 'link datapoints to datasets' do
      click_link plant.results.count
      expect(page).to have_content 'Dataset Listing'
    end
  end
  
  describe 'Search' do
    let!(:plant1) {create(:plant)}
    let!(:plant2) {create(:plant, note: 'note2')}
    
    background do
      click_link 'Plants'
    end

    scenario 'by species' do
      expect(page).to have_content plant1.species
      expect(page).to have_content plant2.species
      fill_in 'Search', with: plant2.species
      click_button 'Go'
      expect(page).to have_content plant2.species
      expect(page).to have_no_content plant1.species
    end
    
    scenario 'by note' do
      fill_in 'Search', with: plant2.note
      click_button 'Go'
      expect(page).to have_content plant2.species
      expect(page).to have_no_content plant1.species
    end
  end
  
  describe 'Show' do
    let(:plant) {create(:plant, :with_data, pub_count: 2)}
    
    background do
      pb = create(:plants_pub, :draft, plant: plant)
      create(:dataset, :draft, :with_data, plants_pub: pb)

      expect(plant.datasets.published.count).to eq 2
      expect(plant.datasets.count).to eq 3
      click_link 'Plants'
      # Only displays published plant
      expect(page).to have_content 'Displaying 1 plant'
      click_link plant.species
    end
    
    context 'published item' do      
      scenario 'list published datasets' do
        expect(page).to have_content "View 2 Datasets"
      end

    end

    context 'unpublished item' do
      scenario 'list all datasets' do
        plant.published_at = nil
        plant.save!
        visit url_for plant
        expect(page).to have_content "View 3 Datasets"
      end
    end
  end
end
