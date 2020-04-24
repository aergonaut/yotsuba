# typed: true
class TurnipMarket < ApplicationRecord
  belongs_to :island
  has_many :turnip_valuations

  def current_price
    turnip_valuations.order(created_at: :desc).first.price
  end
end
