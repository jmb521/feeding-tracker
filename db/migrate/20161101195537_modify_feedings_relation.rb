class ModifyFeedingsRelation < ActiveRecord::Migration[5.0]
  def change
    rename_column :feedings, :child_id, :children_id
  end
end
