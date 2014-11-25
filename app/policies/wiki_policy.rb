class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki 

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end   
  
  def owner
    wiki.user_id == user.id
  end
  def index? 
    true
  end 
  def show?  
   true
  end 
  def new?
    true
  end 
  def create?  
    new?
  end  
  def destroy?
    user.present? && (wiki.user || user.admin)
  end 
  def edit? 
    true
  end
  def update?
    edit? 
  end 
   def edit?
    owner
  end     
  def private?
    user.premium? || user.admin?
  end 
 
end