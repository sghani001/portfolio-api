class AddProjectDetailsToProjects < ActiveRecord::Migration[8.1]
  def change
    add_column :projects, :problem, :text
    add_column :projects, :solution, :text
    add_column :projects, :metrics, :jsonb, default: []
    add_column :projects, :engineering, :jsonb, default: []
  end
end
