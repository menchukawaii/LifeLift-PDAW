class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    # :recoverable,
    :rememberable,
    :validatable

  has_one :inscription
  has_many :rutines
  has_many :trainer_rutines, class_name: "Rutine", foreign_key: "trainer_id"


  def self.ransackable_attributes(auth_object = nil)
    ["email", "is_admin", "is_trainer", "name"]
  end

end
