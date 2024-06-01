class Exercise < ApplicationRecord
  paginates_per 5
  MUSCLE_GROUP = ["Pecho", "Espalda", "Pierna", "Core"]

  def self.ransackable_attributes(auth_object = nil)
    ["muscle_group", "name"]
  end
end
