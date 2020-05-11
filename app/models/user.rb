class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Gravtastic
  gravtastic
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :articles

  def user_name
    self.email.split('.').map(&:capitalize).join(' ').split('@')[0]
  end
  
  if User.all.length >= 1
    u = User.first
    u.admin = true 
    u.save
  end
  
end
