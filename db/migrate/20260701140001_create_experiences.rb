class CreateExperiences < ActiveRecord::Migration[8.1]
  def change
    create_table :experiences do |t|
      t.string :company, null: false
      t.string :role, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date
      t.boolean :current, default: false
      t.string :logo_url
      t.integer :position, default: 0

      t.timestamps
    end
  end
end