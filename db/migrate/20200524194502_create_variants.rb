class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :image_url
      t.string :filename
      t.string :variation
      t.string :variant_id
      t.string :unique_entry_id
      t.integer :buy
      t.integer :sell
      t.string :sources, array: true
      t.string :colors, array: true

      t.references :item, polymorphic: true

      t.timestamps
    end
  end
end
