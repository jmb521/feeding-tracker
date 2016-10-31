class CreateChildrenFeedings < ActiveRecord::Migration[5.0]
  def change
    rename_column :children, :feedings, :feeding_id

    create_table :children_feedings do |t|
      t.integer :feeding_id
      t.integer :child_id
    end



  end
end
