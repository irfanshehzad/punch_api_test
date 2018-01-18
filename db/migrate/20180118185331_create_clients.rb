class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :project_id
      
      t.timestamps
    end
  end
end
