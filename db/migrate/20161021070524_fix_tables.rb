class FixTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :parents

    create_table :parents do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :email
      t.integer :family_id

    end

    create_table :parents_children do |t|
      t.integer :child_id
      t.integer :parent_id
    end

  end
end
