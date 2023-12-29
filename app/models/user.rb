class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Asociaciones
  has_many :restaurants
  has_one_attached :photo

  enum gender: {
    "Hombre" => 0,
    "Mujer" => 1,
    "Prefiero no decir" => 2
  }
end
