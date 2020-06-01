module Types
  class VariantType < Types::BaseObject
    description "An item variant"

    global_id_field :id

    field :image_url, String, null: true
    field :filename, String, null: true
    field :variation, String, null: true
    field :variant_id, String, null: true
    field :unique_entry_id, String, null: true
    field :buy, Integer, null: true
    field :sell, Integer, null: true
    field :sources, [String], null: false
    field :colors, [String], null: false
  end
end
