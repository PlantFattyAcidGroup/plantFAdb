feature 'FattyAcid' do
  background do
    user = create(:user)
    sign_in_as(user)
  end
  
  describe 'Listing' do
    let!(:fa) {create(:fatty_acid, :with_data)}
    
    background do
      click_link 'Fatty Acids'
    end
    
    scenario 'link datapoints to result table' do
      within('.table') do
        click_link fa.results.count
      end
      expect(page).to have_content 'Results'
      expect(page).to have_content 'Delta notation'
      expect(page).to have_content fa.results.first.value
    end
  end
end