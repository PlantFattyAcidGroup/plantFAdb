require 'rails_helper'

RSpec.describe Draft, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :item }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :item_type }
  it { is_expected.to have_db_column :item_id }
  it { is_expected.to have_db_column :event }
  it { is_expected.to have_db_column :whodunnit }
  it { is_expected.to have_db_column :object }
  it { is_expected.to have_db_column :previous_draft }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :object_changes }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["whodunnit"] }
  it { is_expected.to have_db_index ["updated_at"] }
  it { is_expected.to have_db_index ["item_type"] }
  it { is_expected.to have_db_index ["item_id"] }
  it { is_expected.to have_db_index ["event"] }
  it { is_expected.to have_db_index ["created_at"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :event }

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end