class AddProfileFrontendFields < ActiveRecord::Migration[8.1]
  def change
    add_column :profiles, :tagline, :string
    add_column :profiles, :hero_bullets, :jsonb, default: []
    add_column :profiles, :about_extra, :text
    add_column :profiles, :leetcode_url, :string
  end
end
