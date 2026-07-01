class CreateGemStats < ActiveRecord::Migration[8.0]
  def change
    create_table :gem_stats do |t|
      t.string :name, null: false
      t.bigint :downloads, null: false, default: 0
      t.string :version, null: false
      t.datetime :updated_at, null: false
    end

    add_index :gem_stats, :name, unique: true
  end
end