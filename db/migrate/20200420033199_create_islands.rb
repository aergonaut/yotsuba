# typed: true
class CreateIslands < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
