class User < ApplicationRecord
  has_many :drinks, through: :orders
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates  :email, :date_of_birth, presence: true, uniqueness: {scope: :user_id}
  

end
