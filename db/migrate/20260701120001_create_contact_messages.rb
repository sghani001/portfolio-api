class CreateContactMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :contact_messages do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :message, null: false
      t.string :email_domain
      t.datetime :sent_at
      t.string :delivery_id
      t.timestamps
    end

    add_index :contact_messages, :created_at
    add_index :contact_messages, :sent_at
  end
end