require 'rails_helper'

RSpec.describe Variant, type: :model do
  it { is_expected.to belong_to(:item) }
end
