class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments

  def user_name
    self.email.split('.').map(&:capitalize).join(' ').split('@')[0]
  end
  
end
