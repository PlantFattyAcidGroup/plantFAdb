feature 'Pub' do
  background do
    user = create(:editor)
    sign_in_as(user)
  end

  describe 'Create' do

    background do
      click_link 'Data'
      click_link 'Add Publication'
    end

    scenario 'valid attributes' do
      pub = build(:pub)
      fill_in 'Title', with: pub.wos_title
      fill_in 'Authors', with: pub.wos_authors
      fill_in 'Journal', with: pub.wos_journal
      click_button 'Create'
      expect(page).to have_content "success"
    end

    scenario 'requires title' do
      pub = build(:pub)
      fill_in 'Authors', with: pub.authors
      click_button 'Create'
      expect(page).to have_content "title can't be blank"
    end
  end

  describe 'Edit' do
    let!(:pub) {create(:pub)}
    
    background do  
      visit url_for pub
      click_link 'Edit'
    end

    scenario 'requires title' do
      fill_in 'Title', with: ''
      click_button 'Update'
      expect(page).to have_content "title can't be blank"
      expect(pub.wos_title).to_not eq ''
    end

    scenario 'add note' do
      fill_in 'Note', with: 'Special note text'
      click_button 'Update'
      expect(page).to have_content 'saved'
      pub.reload.draft.publish!
      expect(pub.reload.note).to eq 'Special note text'
    end
    
    scenario 'not available to guests' do
      sign_out
      visit url_for pub
      expect(page).to_not have_content 'Edit'
      visit edit_pub_path(pub)
      expect(page).to have_content 'not authorized'
    end
  end
  
  describe 'Search' do
    let!(:pub1) {create(:pub, wos_authors: 'John Smith')}
    let!(:pub2) {create(:pub, wos_authors: 'Jane Doe', note: 'note2')}
    
    background do
      click_link 'Literature'
      expect(page).to have_content 'Literature Listing'
    end

    scenario 'by author' do
      expect(page).to have_content pub1.wos_authors
      expect(page).to have_content pub2.wos_authors
      fill_in 'Search', with: pub2.wos_authors
      click_button 'Go'
      expect(page).to have_content pub2.wos_authors
      expect(page).to have_no_content pub1.wos_authors
    end
    
    scenario 'by note' do
      fill_in 'Search', with: pub2.note
      click_button 'Go'
      expect(page).to have_content pub2.wos_authors
      expect(page).to have_no_content pub1.wos_authors
    end
  end
  
  describe 'Listing' do
    let!(:pub) {create(:pub, :with_data)}
    
    background do
      click_link 'Literature'
      expect(page).to have_content 'Literature Listing'
    end
    
    scenario 'link datapoints to datasets' do
      click_link pub.results.count
      expect(page).to have_content 'Dataset Listing'
    end
  end

  describe 'Show' do
    let(:pub) {create(:pub, :with_data, plant_count: 2, abstract: '123xyz')}
    let(:draft_pub) {create(:pub, :draft, :with_data, plant_count: 2)}
    let(:draft_plant) {create(:plant, :draft)}
    
    background do
      create(:plants_pub, :draft, :with_data, plant: draft_plant, pub: pub)
      create(:plants_pub, :draft, :with_data, plant: draft_plant, pub: draft_pub)
      expect(draft_pub.plants.count).to eq 3
      expect(pub.plants.count).to eq 3
      click_link 'Literature'
      expect(page).to have_content 'Literature Listing'
    end
    
    context 'published item' do
      background {click_link pub.wos_authors}
      
      scenario 'list published plants' do
        pub.plants.published.each do |plant|
          expect(page).to have_content plant.species
        end
        expect(page).to_not have_content draft_plant.species
      end
      
      scenario 'displays abstract' do
        expect(page).to have_content pub.abstract
      end
    end

    context 'unpublished item' do
      background {visit url_for draft_pub}
      
      scenario 'lists all plants' do
        draft_pub.plants.each do |plant|
          expect(page).to have_content plant.species
        end
        expect(page).to have_content draft_plant.species
      end
    end
  end
end
