class FixParentsTable < ActiveRecord::Migration[5.0]
  def change

    drop_table :parents_children
    drop_table :children

    create_table :children do |t|
      t.string :child_name
      t.integer :parents_id
      
    end

  end
end
