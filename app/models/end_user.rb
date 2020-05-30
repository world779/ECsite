class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def active_for_authentication?
    super && (self.is_active==true)
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :email, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
end
