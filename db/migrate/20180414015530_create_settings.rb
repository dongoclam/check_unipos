class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :key
      t.string :value
      t.string :text

      t.timestamps
    end
  end
end
