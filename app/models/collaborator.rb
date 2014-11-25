class Collaborator < ActiveRecord::Base
  #attr_accessor :user_id, :wiki_id 
  belongs_to :wiki
  belongs_to :user

  def is_owner_of?(wiki)
    wiki.user_id == id
  end 
  def add
    #add collaborator to wiki code
  end   
end
