require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without email' do
    user.email = nil
    expect(user).not_to be_valid
  end
end
