class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :key_name

      t.timestamps
    end

    add_index :tags, :key_name, unique: true
  end
end
