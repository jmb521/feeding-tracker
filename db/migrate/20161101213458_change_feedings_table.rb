class ChangeFeedingsTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :feedings, :feeding, :feedings
  end
end
