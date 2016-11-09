class ChangeChildrensTableParentsId < ActiveRecord::Migration[5.0]
  def change
    rename_column :children, :parents_id, :parent_id
  end
end
