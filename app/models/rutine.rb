class Rutine < ApplicationRecord
  belongs_to :user
  belongs_to :trainer, class_name: "User", foreign_key: "trainer_id"

  has_many :rutine_sets

end
