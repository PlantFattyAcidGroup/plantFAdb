feature 'Dataset' do
  background do
    user = create(:editor)
    sign_in_as(user)
  end

  describe 'Search' do
    let!(:data1) {create(:dataset, :with_data, result_count: 5)}
    
    background do
      click_link 'Literature'
      expect(page).to have_content 'Literature Listing'
    end
    
    scenario 'show download for editors' do
      click_link '5'
      expect(page).to have_content 'Download'
    end
    
    scenario 'hide download for guests' do
      sign_out
      click_link 'Literature'
      click_link '5'
      expect(page).to_not have_content 'Download'
    end
    
    scenario 'hide draft datasets' do
      create(:dataset, :draft, plants_pub: data1.plants_pub)
      click_link '5'
      expect(page).to have_content '5 Datapoints'
      expect(page).to have_content 'Displaying 1 dataset'
    end
    
  end
  
end
