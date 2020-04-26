module Types
  class TurnipMarketType < Types::BaseObject
    description "The Turnip Market for an Island"

    implements GraphQL::Types::Relay::Node

    global_id_field :id

    field :current_price, Integer, null: false

    field :turnip_valuations, Types::TurnipValuationType.connection_type, null: false
  end
end
