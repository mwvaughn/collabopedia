class CollaboratorsController < ApplicationController
   respond_to :html, :xml, :json
  
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @users = User.all
    respond_with @users
  end 

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new
    
    
  end
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build (params[:email])
    @collaborator.wiki = @wiki
    @new_collaborator =Collaborator.new 
    authorize @wiki 
    if @collaborator.save
      flash[:notice] = "Collaborator was created."
    else
      flash[:error] = "There was an error saving. Please try again."
    end

    
  end
   
  def destroy
  end   
end