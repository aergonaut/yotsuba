# typed: true
class CreateTurnipValuations < ActiveRecord::Migration[6.0]
  def change
    create_table :turnip_valuations do |t|
      t.references :turnip_market
      t.integer :price, null: false
      t.integer :period, null: false

      t.timestamps
    end
  end
end
