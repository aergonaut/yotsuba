require "rails_helper"

RSpec.describe AuthenticateUser do
  describe ".call" do
    let(:user_password) { "swordfish" }
    let!(:user) { FactoryBot.create :user, password: user_password, password_confirmation: user_password }
    let(:auth) { AuthenticateUser.new(email: email, password: password) }

    subject { auth.call }

    context "when the email and password are correct" do
      let(:email) { user.email }
      let(:password) { user_password }

      it { is_expected.to eq(user) }
    end

    context "when the email is incorrect" do
      let(:email) { "wrong@wrong.test" }
      let(:password) { user_password }

      it { is_expected.to be_falsey }
    end

    context "when the password is incorrect" do
      let(:email) { user.email }
      let(:password) { "wr0ng" }

      it { is_expected.to be_falsey }
    end
  end
end
