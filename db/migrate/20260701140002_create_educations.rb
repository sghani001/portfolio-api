class CreateEducations < ActiveRecord::Migration[8.1]
  def change
    create_table :educations do |t|
      t.string :school, null: false
      t.string :degree, null: false
      t.string :field
      t.text :description
      t.date :start_date, null: false
      t.date :end_date
      t.string :logo_url
      t.integer :position, default: 0

      t.timestamps
    end
  end
end