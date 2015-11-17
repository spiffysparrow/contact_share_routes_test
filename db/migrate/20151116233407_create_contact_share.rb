class CreateContactShare < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false
    end
    add_foreign_key :contact_shares, :users
    add_foreign_key :contact_shares, :contacts

    add_index :contact_shares, [:contact_id, :user_id], :unique => true

    add_index :contact_shares, :user_id
    add_index :contact_shares, :contact_id
  end
end
