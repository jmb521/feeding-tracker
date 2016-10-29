class CreateNewTables < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :email

    end

    create_table :children do |t|
      t.string :child_name
      t.datetime :feedings
    end
  
  end
end
