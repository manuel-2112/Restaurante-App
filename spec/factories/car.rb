# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :car do
    marca { 'Toyota' }
    modelo { 'Yaris' }
    año { 2016 }
    precio { 200000 }
    dueño { 'Manuel Espinoza' }
    association :user, factory: :user
  end
end