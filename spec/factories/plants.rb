# == Schema Information
#
# Table name: plants
#
#  id                  :integer          not null, primary key
#  sofa_name           :string
#  sofa_family         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  tnrs_name           :string
#  tnrs_family         :string
#  note                :string(3999)
#  tnrs_match          :string
#  name_status         :string
#  family              :string
#  genus               :string
#  species             :string
#  tropicos_url        :string
#  ott_id              :integer
#  accepted_rank       :string
#  matched_rank        :string
#  order_name          :string
#  common_name         :string
#  draft_id            :integer
#  published_at        :datetime
#  trashed_at          :datetime
#  variety             :string
#  tissue              :string           default("Unknown")
#  user_id             :integer
#  authority           :string
#  tnrs_name_submitted :string
#

FactoryGirl.define do
  factory :plant do
    order_name "Dilleniales"
    family "Dilleniaceae"
    genus "Dillenia"
    sequence(:species){|n| "indica #{n}"}
    sequence(:variety){|n| "var. #{n}"}
    published_at Date.today
    trait :draft do
      published_at nil
    end
    
    trait :with_data do
      transient do
        pub_count 2
        datasets_per_pub 1
      end

      after(:create) do |plant, evaluator|
        create_list :plants_pub, evaluator.pub_count, :with_data, plant: plant, dataset_count: evaluator.datasets_per_pub
      end
    end
    
  end
end
