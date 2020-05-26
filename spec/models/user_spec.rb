# typed: false
require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :username }
  it { is_expected.to have_many :islands }

  describe "#to_token" do
    let(:user) { FactoryBot.create :user }

    subject(:token) { user.to_token }

    it "includes the user ID in the `sub` claim" do
      payload, _ = JWT.decode(token.to_s, Rails.application.credentials.jwt_secret_key, algorithm: "HS256")

      expect(payload["sub"]).to eq(user.id)
    end
  end

  describe ".from_token" do
    shared_examples "an invalid token" do
      it { is_expected.to be_nil }
    end

    subject { User.from_token(token) }

    context "with a valid token" do
      let(:user) { FactoryBot.create :user }
      let(:token) { user.to_token }

      it { is_expected.to eq(user) }
    end

    context "when the `sub` claim does not specify a valid user ID" do
      let(:token) { JWT.encode({ sub: User.count + 2 }, Rails.application.credentials.jwt_secret_key, "HS256") }

      it_behaves_like "an invalid token"
    end

    context "when the token doesn't have a valid signature" do
      let(:token) { JWT.encode({ sub: User.count + 2 }, "bad key", "HS256") }

      it_behaves_like "an invalid token"
    end

    context "when the token uses the wrong algorithm" do
      let(:token) { JWT.encode({ sub: User.count + 2 }, nil, "none") }

      it_behaves_like "an invalid token"
    end
  end
end
