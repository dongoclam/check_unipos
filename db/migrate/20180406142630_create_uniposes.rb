class CreateUniposes < ActiveRecord::Migration[5.1]
  def change
    create_table :uniposes do |t|
      t.integer :sender
      t.integer :receiver
      t.integer :point
      t.string :message
      t.datetime :sent_at

      t.timestamps
    end

    add_index :uniposes, [:sender, :receiver, :sent_at], unique: true
  end
end
