class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :employee_id 
      t.string :emp_name
      t.text :designation
      t.string :image
      t.timestamps null: false
    end
  end
end
