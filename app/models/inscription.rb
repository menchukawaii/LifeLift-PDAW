class Inscription < ApplicationRecord
  GOAL = ["Peso", "Musculo", "Ambas"]

  belongs_to :user

  validates :goal, :age, :height, :weight, presence: true
end
