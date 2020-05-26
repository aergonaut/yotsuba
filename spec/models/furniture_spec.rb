require 'rails_helper'

RSpec.describe Furniture, type: :model do
  it { is_expected.to have_many(:variants).dependent(:destroy).inverse_of(:item) }
end
