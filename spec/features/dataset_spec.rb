feature 'Dataset' do
  background do
    user = create(:editor)
    sign_in_as(user)
  end

  describe 'Create' do
    
    let!(:pb) {create(:plants_pub, :with_data)}
    background do
      click_link 'Literature'
      click_link pb.pub.wos_authors
      within('tr', text: pb.plant.species) do
        click_link 'Edit'
      end
      click_link 'New Dataset'
    end

    scenario 'with no attributes' do
      click_button 'Start'
      expect(page).to have_content "Editing Dataset"
    end

    scenario 'with basic attributes' do
      fill_in 'Remarks', with: "Test remarks"
      select 'Total Oil', from: 'Lipid type'
      click_button 'Start'
      expect(page).to have_content "Test remarks"
    end
    
    scenario 'dbxref_value requires dbxref selection' do
      fill_in 'Dbxref value', with: 'test123'
      click_button 'Start'
      expect(page).to have_content "can't be blank"
    end
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
