# frozen_string_literal: true

class Ask < ApplicationRecord
  belongs_to :car
  has_and_belongs_to_many :asks

  # validates :id, presence: true, numericality: { only_integer: true }
  # validates :name, presence: true
  # validates :mail, presence: true
  # validates :reason, presence: true
end
