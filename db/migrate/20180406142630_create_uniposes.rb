class CreateUniposes < ActiveRecord::Migration[5.1]
  def change
    create_table :uniposes do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :point
      t.text :message
      t.string :unipos_id
      t.integer :reaction
      t.integer :praise_count
      t.integer :self_praise_count
      t.datetime :sent_at

      t.timestamps
    end

    add_index :uniposes, :sender_id
    add_index :uniposes, :receiver_id
    add_index :uniposes, :unipos_id, unique: true
  end
end
