class CreateUniposUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :unipos_users do |t|
      t.string :name
      t.string :avatar
      t.string :unipos_id
      t.string :unipos_name
      t.integer :total_sent
      t.integer :total_received

      t.timestamps
    end

    add_index :unipos_users, :unipos_id, unique: true
    add_index :unipos_users, :unipos_name, unique: true
    add_index :unipos_users, :total_sent
    add_index :unipos_users, :total_received
  end
end
