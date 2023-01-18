class User < ApplicationRecord
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enum :type, {Novice: "Novice", Expert: "Expert"}
  enum :status, {qualified: "qualified", not_qualified: "not qualified", banned: "banned"}
  has_many :comments, dependent: :destroy
  # def is_novice?
  #   current_user.type == 'novice'
  # end

  # def is_expert?
  #   binding.pry
  #   current_user.type == 'expert'
  # end
end
