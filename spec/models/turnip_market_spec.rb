require "rails_helper"

RSpec.describe TurnipMarket, type: :model do
  it { is_expected.to belong_to :island }
  it { is_expected.to have_many :turnip_valuations }

  describe "#current_price" do
    let(:market) { FactoryBot.create(:turnip_market) }
    let(:valuations) { FactoryBot.create_list(:turnip_valuation, 3, turnip_market: market, price: 24) }
    let(:current_valuation) { FactoryBot.create(:turnip_valuation, turnip_market: market, price: 99) }

    before do
      market.turnip_valuations = valuations
      market.turnip_valuations << current_valuation
    end

    subject { market.current_price }

    it "returns the price of the most recent valuation" do
      expect(subject).to eq(current_valuation.price)
    end
  end
end
