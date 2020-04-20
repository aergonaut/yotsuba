FactoryBot.define do
  factory :turnip_valuation do
    period { :morning }
    price { 42 }
    turnip_market
  end
end
