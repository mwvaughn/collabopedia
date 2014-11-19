class User < ActiveRecord::Base
  #roles: [:user, :premium, :admin]
  #after_initialize :set_default_role, :if => :new_record
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis, through: :collaborators
  has_many :collaborators  

  

  def set_default_role 
    self.role ||= :User
  end  

  def is_owner_of?(wiki)
    wiki.user_id == id
  end 

  def is_a_collaborator?(wiki)
    #false
    false
  end
end 