class AddSignupToUser < ActiveRecord::Migration
  def change
    # confirmable
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    # lockable
    add_column :users, :failed_attempts, :integer
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
    
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
    
    # Confirm all existing users
    User.transaction do
      User.all.each do |u|
        u.skip_confirmation!
        u.save!
      end
    end
  end
end