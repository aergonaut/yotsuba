module Types
  class TurnipValuationType < Types::BaseObject
    description "The Turnip Market for an Island"

    implements GraphQL::Types::Relay::Node

    global_id_field :id

    field :price, Integer, null: false
    field :period, Types::ValuationPeriod, null: false
    field :date, String, null: false, method: :created_at
  end
end
