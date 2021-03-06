require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:item) }

  it { is_expected.to belong_to(:user) }
end
