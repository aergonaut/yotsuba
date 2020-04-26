# typed: strict
class TurnipValuation < ApplicationRecord
  belongs_to :turnip_market

  enum period: {morning: 0, evening: 1}
end
