# typed: true
module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    add_field(GraphQL::Types::Relay::NodeField)
    add_field(GraphQL::Types::Relay::NodesField)

    field :viewer, UserType, null: true do
      description "The currently authenticated user"
    end

    def viewer
      context[:current_user]
    end

    field :search_furniture, [FurnitureType], null: false do
      description "Search furniture items"
      argument :query, String, "Search query", required: true
    end

    def search_furniture(query:)
      Furniture.search_text(query)
    end
  end
end
