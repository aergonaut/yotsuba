require "rails_helper"

RSpec.describe TurnipMarket, type: :model do
  it { is_expected.to belong_to :island }
  it { is_expected.to have_many :turnip_valuations }

  describe "#current_price" do
    let(:market) { FactoryBot.build(:turnip_market) }
    subject { market.current_price }
    it "returns the price of the most recent valuation" do
      expect(subject).to eq(0)
    end
  end
end
