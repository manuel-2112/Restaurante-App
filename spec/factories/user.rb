# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :user do
    email { 'example@gmail.com' }
    name { 'Manuel Espinoza' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
