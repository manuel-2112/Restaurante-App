# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :ask do
    name { 'Manuel Espinoza' }
    mail { 'example@gmail.com' }
    dates { '2022-10-01 2022-10-15' }
    reason { 'Lorem ipsum' }
    association :user, factory: :user
    association :turno, factory: :turno
  end
end