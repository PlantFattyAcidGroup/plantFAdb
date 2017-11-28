# == Schema Information
#
# Table name: measures
#
#  id             :integer          not null, primary key
#  type           :string
#  delta_notation :string
#  cas_number     :string
#  sofa_mol_id    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  lipidmap_id    :string
#  pubchem_id     :string
#  chebi_id       :string
#  structure      :text
#  mass           :float
#  name           :string
#  other_names    :string(3999)
#  formula        :string
#  cml            :text
#  inchi          :string
#  stdinchi       :string
#  stdinchikey    :string
#  smiles         :string
#  image_link     :string
#  common_name    :string
#  category       :string
#  draft_id       :integer
#  published_at   :datetime
#  trashed_at     :datetime
#  iupac_name     :string
#  user_id        :integer
#

FactoryGirl.define do
  factory :measure do
    published_at Date.today
    trait :draft do
      published_at nil
    end
    trait :with_data do
      transient do
        result_count 1
      end
      after(:create) do |m, evaluator|
        create_list :result, evaluator.result_count, measure: m
      end
    end
    factory :fatty_acid, class: FattyAcid do
      name Faker::Name.name
      formula "C10H2"
      mass Faker::Number.decimal(3,2)
    end
    factory :parameter, class: Parameter do
      name Faker::Name.name
      trait :oil_content do
        name 'Oil Content'
        delta_notation 'Oil Content'
      end
    end
  end
end
