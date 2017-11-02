feature 'Result' do
  background do
    sign_in
  end
  
  describe 'Create', js: true do
    self.use_transactional_fixtures = false
    let!(:dataset) {create(:dataset)}
    let!(:fa) {create(:fatty_acid)}
    background do
      visit edit_dataset_path(dataset)
    end
    
    scenario 'autosaves value changes' do
      within('#result_idx_0') do
        fill_autocomplete('#measure', with: fa.name)
        fill_in 'result_value', with: '10'
        expect(page).to have_button 'Save'
        expect(page).to have_content 'New'
      end
    end
    
    scenario 'does not save without measure' do
      within('#result_idx_0') do
        fill_in 'result_value', with: '10'
        expect(page).to have_content "Measure can't be blank"
      end
    end
    
    scenario 'creates a draft' do
      within('#result_idx_0') do
        fill_autocomplete('#measure', with: fa.name)
        fill_in 'result_value', with: '10'
        expect(page).to have_content 'New'
        expect(dataset.results.count).to be 1
        result = dataset.results.first
        expect(result.published_at).to be nil
        expect(result.draft).to_not be nil
      end
    end
    
    context 'draft' do
      let(:result) {build(:result, :draft, dataset: dataset)}
      background do
        result.save_draft
        click_link 'Data'
        within('tr', text: dataset.display_name){expect(page).to have_content 'Update'}
      end
      
      scenario 'dataset dependency' do
        within('tr', text: dataset.display_name) {click_link 'Details'}
        within('#on_Publish') do
          expect(page).to have_content 'New'
          expect(page).to have_content result.measure.display_name
        end
        within('#on_Revert') do
          expect(page).to have_content 'New'
          expect(page).to have_content result.measure.display_name
        end
      end
      
      scenario 'publish from dataset' do
        published = dataset.published_at
        within('tr', text: dataset.display_name) {click_link 'Publish'}          
        expect(page).to have_content "draft was published"
        expect(dataset.reload.published_at).to be > published
        result.reload
        expect(result.published_at).to_not be nil
        expect(result.draft).to be nil
      end
      
      scenario 'revert from dataset' do
        within('tr', text: dataset.display_name) {click_link 'Revert'}
        expect(page).to have_content "draft was reverted"
        expect(Result.find_by(id: result.id)).to be nil
        expect(Draftsman::Draft.find_by(id: result.draft_id)).to be nil
      end
    end
    
  end
  
  describe 'Update' do
    let!(:dataset) {create(:dataset, :with_data)}
    background do
      visit edit_dataset_path(dataset)
    end
    
    scenario 'creates a draft' do
      result = dataset.results.first
      within("#result_#{result.id}") do
        fill_in 'result_value', with: (result.value.to_f+10).to_s
        click_button "Save"
      end
      # page is reloaded
      expect(page).to have_content "Update"
      result.reload
      expect(result.draft).to_not be nil
      expect(result.draft.update?).to be true
    end
    
    context 'draft' do
      let(:result) {dataset.results.first}
      let(:old_value) {result.value}
      background do
        result.value = (old_value.to_f + 10).to_s
        result.save_draft
        click_link 'Data'
        within('tr', text: dataset.display_name){expect(page).to have_content 'Update'}
      end
      
      scenario 'dataset dependency' do
        within('tr', text: dataset.display_name) {click_link 'Details'}
        within('#on_Publish') do
          expect(page).to have_content 'Update'
          expect(page).to have_content result.measure.display_name
        end
        within('#on_Revert') do
          expect(page).to have_content 'Update'
          expect(page).to have_content result.measure.display_name
        end
      end
      
      scenario 'publish from dataset' do
        published = dataset.published_at
        within('tr', text: dataset.display_name) {click_link 'Publish'}          
        expect(page).to have_content "draft was published"
        result.reload
        expect(result.published_at).to_not be nil
        expect(result.draft).to be nil
        expect(result.value.round(2)).to eq (old_value.to_f+10).round(2)
      end
      
      scenario 'revert from dataset' do
        within('tr', text: dataset.display_name) {click_link 'Revert'}
        expect(page).to have_content "draft was reverted"
        result.reload
        expect(result.published_at).to_not be nil
        expect(result.draft).to be nil
        expect(result.value).to eq old_value
      end
    end
  end
  
  describe 'Destroy', js: true do
    self.use_transactional_fixtures = false
    
    context 'unpublished item' do
      let!(:dataset) {create(:dataset, :draft_result)}
      background do
        expect(dataset.results.count).to be 1
        expect(dataset.results.first.draft?).to be true
        visit edit_dataset_path(dataset)
      end
      
      scenario 'is destroyed without drafting' do
        result = dataset.results.first
        within("#result_#{result.id}") do
          find("a[data-method='delete']").click
          expect(page).to have_content "Result has been removed"
          expect(Result.all).to_not include result
        end
      end
    end
    
    context 'published item' do
      let!(:dataset) {create(:dataset, :with_data)}
      background do
        visit edit_dataset_path(dataset)
      end
      
      scenario 'creates a draft' do
        result = dataset.results.first
        within("#result_#{result.id}") do
          find("a[data-method='delete']").click
          expect(page).to have_content "Delete"
          result.reload
          expect(result.destroyed?).to be false
          expect(result.draft).to_not be nil
          expect(result.draft.destroy?).to be true
        end
      end
      
      context 'draft' do
        let(:result) {dataset.results.first}
        background do
          result.draft_destruction
          click_link 'Data'
          within('tr', text: dataset.display_name){expect(page).to have_content 'Update'}
        end
      
        scenario 'dataset dependency' do
          within('tr', text: dataset.display_name) {click_link 'Details'}
          within('#on_Publish') do
            expect(page).to have_content 'Delete'
            expect(page).to have_content result.measure.display_name
          end
          within('#on_Revert') do
            expect(page).to have_content 'Delete'
            expect(page).to have_content result.measure.display_name
          end
        end
      
        scenario 'publish from dataset' do
          within('tr', text: dataset.display_name) {click_link 'Publish'}
          expect(page).to have_content "draft was published"
          expect(Result.find_by(id: result.id)).to be nil
          expect(Draftsman::Draft.find_by(id: result.draft_id)).to be nil
        end
        
        scenario 'revert from dataset' do
          within('tr', text: dataset.display_name) {click_link 'Revert'}          
          expect(page).to have_content "draft was reverted"
          expect(Result.find_by(id: result.id)).to_not be nil
          result.reload
          expect(result.published?).to be true
          expect(result.trashed_at).to be nil
          expect(result.draft).to be nil
        end
      end
    end
  end
end