class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    # :recoverable,
    :rememberable,
    :validatable

  has_one :inscription

  def self.ransackable_attributes(auth_object = nil)
    ["email", "is_admin", "is_trainer", "name"]
  end

end
