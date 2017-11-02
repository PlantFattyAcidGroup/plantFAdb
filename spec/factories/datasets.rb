# == Schema Information
#
# Table name: datasets
#
#  id            :integer          not null, primary key
#  remarks       :string
#  notes         :string
#  lipid_type    :string
#  dbxref_value  :string
#  plants_pub_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  draft_id      :integer
#  published_at  :datetime
#  trashed_at    :datetime
#  dbxref_id     :integer
#  tissue        :string
#

FactoryGirl.define do
  factory :dataset do
    plants_pub
    published_at Date.today
    trait :draft do
      published_at nil
    end
    trait :with_data do
      transient do
        result_count 2
      end

      after(:create) do |ds, evaluator|
        fa = create(:fatty_acid)
        create_list :result, evaluator.result_count-1, dataset: ds, measure: fa
        oil = create(:parameter, :oil_content)
        create :result, dataset: ds, measure: oil
      end
    end
    
    trait :draft_result do
      after(:create) do |ds, evaluator|
        r = build :result, dataset: ds
        r.save_draft
      end
    end
  end
end
