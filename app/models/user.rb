class User < ActiveRecord::Base
  #roles: [:user, :premium, :admin]
  after_initialize :set_default_role,  :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis
  has_many :collaborators  
  has_many :cowikis, through: :collaborators
  
  

  

  def set_default_role 
    self.role ||= :user
  end

  def admin?
   role == 'admin'
  end
 
  def user? # free user
   role == 'user'
  end

  def premium? 

      role == 'premium'
  end     
end 