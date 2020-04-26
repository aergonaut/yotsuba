# typed: strict
module Types
  class UserType < Types::BaseObject
    description "A user"

    implements GraphQL::Types::Relay::Node

    global_id_field :id

    field :email, String, null: false do
      description "The user's email"
    end
    field :username, String, null: false do
      description "The user's username"
    end

    field :islands, IslandType.connection_type, null: false do
      description "The user's islands"
    end
  end
end
