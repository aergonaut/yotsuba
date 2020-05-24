module Types
  module FurnitureType
    include Types::BaseInterface

    description "A furniture item"

    field :name, String, "The item's name", null: false
    field :diy, Boolean, "Is this item a DIY?", null: false
    field :catalog, Boolean, "Is this item buyable through the catalog?", null: false

    field :source_notes, String, "Extra information about how to obtain this item", null: true
    field :series, String, "The series this item belongs to", null: true
    field :size, String, "The item's size in world", null: true

    field :variants, Types::VariantType.connection_type, null: false do
      description "This item's variants"
    end

    orphan_types FenceType, FloorType, HousewareType, KomonoType, RugType, WallMountedType, WallpaperType
  end
end
