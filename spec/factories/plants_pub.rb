FactoryGirl.define do
  factory :plants_pub do
    plant
    pub
    published_at Date.today
    trait :draft do
      published_at nil
    end
    trait :with_data do
      transient do
        dataset_count 1
        results_per_dataset 2
      end

      after(:create) do |pb, evaluator|
        create_list :dataset, evaluator.dataset_count, :with_data, plants_pub: pb, result_count: evaluator.results_per_dataset
      end
    end
  end
end