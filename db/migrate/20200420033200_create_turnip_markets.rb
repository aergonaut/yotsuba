# typed: true
class CreateTurnipMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :turnip_markets do |t|
      t.references :island

      t.timestamps
    end
  end
end
