class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    # :recoverable,
    :rememberable,
    :validatable

  has_one :inscription, dependent: :destroy
  has_many :rutines, dependent: :destroy
  has_many :rutine_sets, through: :rutines

  has_many :trainer_rutines, class_name: "Rutine", foreign_key: "trainer_id"
  # has_many :trainer_rutine_sets, through: :trainer_rutines, class_name: "RutineSet", foreign_key: "rutine_id"

  belongs_to :trainer, class_name: "User", foreign_key: "trainer_id", optional: true
  has_many :my_users, class_name: "User", foreign_key: "trainer_id"

  validate :password_complexity
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["email", "is_admin", "is_trainer", "name"]
  end

  private

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!¡@$%^&*,.;:\[\]\/\(\)=¿_{}<>-]).{8,}$/

    errors.add :password, I18n.t("errors.messages.low_complexity")
  end
end
