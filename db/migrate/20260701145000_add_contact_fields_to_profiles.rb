class AddContactFieldsToProfiles < ActiveRecord::Migration[8.1]
  def change
    change_table :profiles do |t|
      t.string :phone
      t.string :website
      t.string :contact_email
      t.jsonb :additional_contacts, default: []
    end
  end
end