module Mutations
  class CreateTurnipValuation < BaseMutation
    description "Log a turnip valuation from a turnip market."

    argument :turnip_market_id, ID, required: true do
      description "The Node ID of the turnip market to record this valuation"
    end

    argument :price, Integer, required: true do
      description "The turnip price"
    end

    argument :period, Types::ValuationPeriod, required: true do
      description "The period of the day that this price was quoted"
    end

    field :turnip_valuation, Types::TurnipValuationType, null: true do
      description "The new turnip valuation. Null if the valuation could not be created."
    end

    field :errors, [String], null: false

    def resolve(turnip_market_id:, price:, period:)
      turnip_market = GlobalID::Locator.locate_signed(turnip_market_id)
      if turnip_market
        valuation = turnip_market.turnip_valuations.build(price: price, period: period)
        if valuation.save
          {
            turnip_valuation: valuation,
            errors: []
          }
        else
          {
            errors: valuation.errors.full_messages
          }
        end
      else
        {
          errors: ["Turnip market does not exist"]
        }
      end
    end
  end
end
