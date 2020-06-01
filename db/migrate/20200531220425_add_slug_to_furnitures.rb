class AddSlugToFurnitures < ActiveRecord::Migration[6.0]
  def change
    add_column :furnitures, :slug, :string
  end
end
