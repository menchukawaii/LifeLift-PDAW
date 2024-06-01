class Exercise < ApplicationRecord
  MUSCLE_GROUP = ["Pecho", "Espalda", "Pierna", "Core"]

  def self.ransackable_attributes(auth_object = nil)
    ["muscle_group", "name"]
  end
end
