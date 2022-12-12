# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Review, type: :model do
  let(:user) { create(:user) }
  let(:car) { create(:user) }

  before(:each) do
    @review = Review.new(user_id: user.id, car_id: car.id, calificacion: rand(1...5), contenido: Faker::Lorem.sentence)
  end

  it 'is valid with valid attributes' do
    expect(@review).to be_valid
  end

  it 'is not valid without car' do
    @review.car_id = nil
    expect(@review).not_to be_valid
  end

  it 'is not valid without usuario' do
    @review.user_id = nil
    expect(@review).not_to be_valid
  end

  it 'is not valid without calificacion' do
    @review.calificacion = nil
    expect(@review).not_to be_valid
  end

  it 'is not valid without contenido' do
    @review.contenido = nil
    expect(@review).not_to be_valid
  end

  it 'is not valid with out of range calificacion' do
    @review.calificacion = rand(6..30)
    expect(@review).not_to be_valid
  end
end
