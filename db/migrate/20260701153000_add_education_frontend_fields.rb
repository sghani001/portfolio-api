class AddEducationFrontendFields < ActiveRecord::Migration[8.1]
  def change
    add_column :educations, :gpa, :string
    add_column :educations, :duration, :string
    change_column_null :educations, :start_date, true
  end
end
