class Mensaje < ApplicationRecord
  # validates :contenido, presence: true
  # validates :car_id, presence: true, numericality: { only_integer: true }
  # validates :contenido, presence: true

  belongs_to :user
  belongs_to :car
end
