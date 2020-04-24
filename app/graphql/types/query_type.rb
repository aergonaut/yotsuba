# typed: true
module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :viewer, UserType, null: true do
      description "The currently authenticated user"
    end

    def viewer
      context[:current_user]
    end
  end
end
