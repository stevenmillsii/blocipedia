class CollaboratorsController < ApplicationController
  def create
    Wiki.find(params[:wiki_id]).collaborator_users << User.find(params[:user_id])
    redirect_to :back
  end
  def destroy
    Collaborator.find(params[:id]).destroy
    redirect_to :back
  end
end
