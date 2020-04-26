# typed: true
module Types
  class MutationType < Types::BaseObject
    field :create_island, mutation: Mutations::CreateIsland
    field :create_turnip_valuation, mutation: Mutations::CreateTurnipValuation
  end
end
