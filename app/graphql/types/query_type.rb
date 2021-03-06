# typed: true
module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    add_field(GraphQL::Types::Relay::NodeField)
    add_field(GraphQL::Types::Relay::NodesField)

    field :current_user, UserType, null: true do
      description "The currently authenticated user"
    end

    def current_user
      context[:current_user]
    end

    field :furnitures, Types::FurnitureType.connection_type, null: false do
      description "List furniture items"
      argument :query, String, "Search query", required: false
    end

    def furnitures(query: nil)
      if query
        Furniture.search_text(query)
      else
        Furniture.all
      end
    end

    field :furniture, Types::FurnitureType, null: true do
      description "Find a furniture item by slug"
      argument :slug, String, "The item's slug", required: true
    end

    def furniture(slug:)
      Furniture.find_by(slug: slug)
    end
  end
end
