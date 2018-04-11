class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.string :unipos_id
      t.string :unipos_name
      t.integer :total_sent
      t.integer :total_received
      t.integer :total_clapped

      t.timestamps
    end

    add_index :users, :unipos_id, unique: true
    add_index :users, :unipos_name
    add_index :users, :total_sent
    add_index :users, :total_received
    add_index :users, :total_clapped
  end
end
