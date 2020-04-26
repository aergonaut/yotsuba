module Mutations
  class CreateIsland < BaseMutation
    description "Create an island. The island will be associated the currently authenticated user."

    argument :name, String, required: true do
      description "The name of the island."
    end

    field :island, Types::IslandType, null: true do
      description "The new island. Null if the island could not be created."
    end

    field :errors, [String], null: false do
      description "Error messages."
    end

    def resolve(name:)
      current_user = context[:current_user]
      island = current_user.islands.build(name: name)
      if island.save
        {
          island: island,
          errors: []
        }
      else
        {
          island: nil,
          errors: island.errors.full_messages
        }
      end
    end
  end
end
