class AddUserToIslands < ActiveRecord::Migration[6.0]
  def change
    add_reference :islands, :user
  end
end
