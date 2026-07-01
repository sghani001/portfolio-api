class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :headline
      t.text :bio
      t.string :location
      t.string :avatar_url
      t.string :resume_url
      t.jsonb :social_links, default: {}
      t.jsonb :skills, default: []
      t.boolean :available_for_hire, default: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end