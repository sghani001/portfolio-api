class CreateProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description
      t.text :long_description
      t.string :url
      t.string :github_url
      t.jsonb :tech_stack, default: []
      t.jsonb :images, default: []
      t.boolean :featured, default: false
      t.integer :position, default: 0

      t.timestamps
    end
  end
end