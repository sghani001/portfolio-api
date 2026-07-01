class AddExperienceFrontendFields < ActiveRecord::Migration[8.1]
  def change
    add_column :experiences, :company_url, :string
    add_column :experiences, :location, :string
    add_column :experiences, :roles, :jsonb, default: []
    add_column :experiences, :points, :jsonb, default: []
    change_column_null :experiences, :role, true
    change_column_null :experiences, :start_date, true
  end
end
