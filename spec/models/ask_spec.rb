require 'rails_helper'

RSpec.describe Ask, type: :model do

  let(:ask) { create(:ask) }

  it 'is valid with valid attributes' do
    expect(ask).to be_valid
  end

  it 'no es valida sin modelo' do
    ask.model = nil
    expect(ask).not_to be_valid
  end
  
  it 'no es valida sin auto' do
    ask.car = nil
    expect(ask).not_to be_valid
  end

end
