class CreateUniposes < ActiveRecord::Migration[5.1]
  def change
    create_table :uniposes do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :point
      t.string :message
      t.datetime :sent_at

      t.timestamps
    end

    add_index :uniposes, :sender_id
    add_index :uniposes, :receiver_id
    add_index :uniposes, [:sender_id, :receiver_id, :sent_at], unique: true
  end
end
