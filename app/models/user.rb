class User < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  has_many :tweets
  #Timeline End

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
