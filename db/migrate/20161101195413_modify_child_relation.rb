class ModifyChildRelation < ActiveRecord::Migration[5.0]
  def change
    rename_column :children_feedings, :child_id, :children_id
  end
end
