class CreateEmployeeProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_projects do |t|
      t.integer :employee_id
      t.integer :project_id

      t.timestamps
    end
  end
end
