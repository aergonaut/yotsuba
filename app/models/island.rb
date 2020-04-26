# typed: strong
class Island < ApplicationRecord
  belongs_to :user
  has_one :turnip_market

  validates :name, presence: true

  after_create :create_turnip_market!
end
