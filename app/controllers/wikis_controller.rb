class WikisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wikis = policy_scope(Wiki)
    @wikis = current_user.admin? || current_user.premium? ? Wiki.all : Wiki.where(private: false)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.all
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.user = current_user
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error. Please try again"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error. Please try again!"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice]= "\"#{@wiki.title}\" was deleted succesfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :show
    end
  end
end
