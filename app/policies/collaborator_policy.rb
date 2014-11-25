class CollaboratorPolicy < ApplicationPolicy
  attr_reader :collaborator, :wiki, :user

  def initialize(collaborator, wiki)
    @collaborator = collaborator
    @wiki = wiki
    @user = user
  end   

  def create?
    user.wiki.present? && user.premium? || user.admin?
  end

  def new?
    create?
  end
end 

