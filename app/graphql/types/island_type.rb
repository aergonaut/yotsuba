module Types
  class IslandType < Types::BaseObject
    description "An island"

    implements GraphQL::Types::Relay::Node

    global_id_field :id

    field :name, String, null: false do
      description "The name of the island"
    end

    field :user, UserType, null: false do
      description "The island's owner"
    end

    field :turnip_market, TurnipMarketType, null: false
  end
end
