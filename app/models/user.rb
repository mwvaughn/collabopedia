class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis   
  has_many :wikis
  def user?
    user == 'user'
  end 

  def premium_user? 
    premium_user == 'premium user'
  end
end 