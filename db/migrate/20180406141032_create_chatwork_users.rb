class CreateChatworkUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chatwork_users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.integer :chatwork_id
      t.string :chatwork_name
      t.string :phone
      t.text :department
      t.boolean :checked, default: false

      t.timestamps
    end

    add_index :chatwork_users, :email, unique: true
    add_index :chatwork_users, :chatwork_id, unique: true
    add_index :chatwork_users, :chatwork_name
  end
end
