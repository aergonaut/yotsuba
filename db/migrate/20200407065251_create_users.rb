# typed: true
# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.index :email, unique: true
      t.string :username, null: false
      t.index :username, unique: true
      t.string :password_digest, null: false, default: ""

      t.timestamps null: false
    end
  end
end
