module Types
  class ValuationPeriod < Types::BaseEnum
    value "MORNING", "Valuation from before 12 noon", value: "morning"
    value "EVENING", "Valuation from after 12 noon", value: "evening"
  end
end
