class CreateChatworkUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chatwork_users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.integer :account_id
      t.string :chatwork_id
      t.string :phone
      t.string :department

      t.timestamps
    end

    add_index :chatwork_users, :email, unique: true
    add_index :chatwork_users, :account_id, unique: true
    add_index :chatwork_users, :chatwork_id, unique: true
  end
end
