class CollaboratorsController < ApplicationController
  
  def index
    @wiki = Wiki.find(params[:wiki_id])
    @users = User.all
    @collaborators = @wiki.collaborators
  
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
      #how do I update the show page with the saved wiki collaborator? IOW, how to comnnect them?  
      flash[:notice] = "Collaborator was created."
      
    else
      flash[:error] = "There was an error saving. Please try again."
    end
    #redirect_to wiki_collaborator_path(@wiki, collaborators) ? 

  def Update
    
   end
   
   
  def destroy
  end   
end
end 