require 'rails_helper'

RSpec.describe ColorPalette, type: :model do
  it { should have_many(:user_palettes) }
  it { should have_many(:users) }

  it { should have_valid(:hex_1).when("#ffffff") }
  it { should_not have_valid(:hex_1).when(nil, '') }
end
