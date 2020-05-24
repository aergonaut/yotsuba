class CreateFurnitures < ActiveRecord::Migration[6.0]
  def change
    create_table :furnitures do |t|
      t.string :type, null: false

      t.string :name, null: false

      t.boolean :diy, default: false, null: false
      t.boolean :catalog, default: false, null: false

      t.string :source_notes
      t.string :series
      t.string :size

      t.index :type

      t.timestamps
    end
  end
end
