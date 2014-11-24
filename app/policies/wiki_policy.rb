class WikiPolicy < ApplicationPolicy
  def index? 
    true
  end 
  def show?  
   true
  end 
  def destroy?
    user.present? && (record.user || user.admin)
  end 
  def edit? 
    true
  end  
  def private?
    user.premium? || user.admin?
  end 
 
end