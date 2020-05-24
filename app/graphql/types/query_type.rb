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

    field :furniture, Types::FurnitureType.connection_type, null: false do
      description "List furniture items"
      argument :query, String, "Search query", required: false
    end

    def furniture(query: nil)
      if query
        Furniture.search_text(query)
      else
        Furniture.all
      end
    end
  end
end
