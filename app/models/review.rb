# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :car

  # validates :id, presence: true, numericality: { only_integer: true }
  # validates :calificacion, presence: true, numericality: { only_integer: true }
  # validates :contenido, presence: true,length: { maximum: 100 }
end
