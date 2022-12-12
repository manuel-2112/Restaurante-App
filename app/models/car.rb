# frozen_string_literal: true

class Car < ApplicationRecord
  has_many :reviews
  has_many :asks
  belongs_to :user

  # validates :id, presence: true, numericality: { only_integer: true }
  # validates :marca, presence: true
  # validates :modelo, presence: true
  # validates :año, presence: true, numericality: { only_integer: true }
  # validates :precio, presence: true, numericality: { only_integer: true }
  # validates :dueño, presence: true
end
