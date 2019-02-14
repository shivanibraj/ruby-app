class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :tech_stack
      t.text :clent_details

      t.timestamps null: false
    end
  end
end
