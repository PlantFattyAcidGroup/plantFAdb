# == Schema Information
#
# Table name: pubs
#
#  id            :integer          not null, primary key
#  year          :string
#  authors       :string
#  journal       :string
#  volume        :string
#  page          :string
#  remarks       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  wos_uid       :string
#  wos_journal   :string
#  wos_title     :string(500)
#  wos_volume    :string
#  wos_authors   :string
#  wos_pages     :string
#  wos_year      :string
#  doi           :string
#  original_pubs :text
#  abstract      :string(4000)
#  url           :string(1000)
#  draft_id      :integer
#  published_at  :datetime
#  trashed_at    :datetime
#  user_id       :integer
#  note          :string
#

FactoryGirl.define do
  factory :pub do
    sequence(:wos_authors) {|n| "Ohlrogge et al. #{n}"}
    wos_journal "Science"
    wos_title "PlantFAdb"
    published_at Date.today
    trait :draft do
      published_at nil
    end
    
    trait :with_data do
      transient do
        plant_count 2
        datasets_per_plant 1
      end

      after(:create) do |pub, evaluator|
        create_list :plants_pub, evaluator.plant_count, :with_data, pub: pub, dataset_count: evaluator.datasets_per_plant
      end
    end
  end
end
