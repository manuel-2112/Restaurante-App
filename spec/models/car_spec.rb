require 'rails_helper'

RSpec.describe Car, type: :model do

  #let(:car) { create(:car) }

  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
    @car = FactoryBot.create(:car)
  end

  it 'is valid with valid attributes' do
    expect(@car).to be_valid
  end
  
  it 'no es valido sin marca' do
    @car.marca = nil
    expect(@car).not_to be_valid
  end

  it 'no es valido sin modelo' do
    @car.modelo = nil
    expect(@car).not_to be_valid
  end

  it 'no es valido sin año' do
    @car.año = nil
    expect(@car).not_to be_valid
  end

  it 'no es valido sin precio' do
    @car.precio = nil
    expect(@car).not_to be_valid
  end

  it 'no es valido sin dueño' do
    @car.dueño = nil
    expect(@car).not_to be_valid
  end

end
