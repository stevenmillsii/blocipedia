class WikisController < ApplicationController
<<<<<<< HEAD
=======
  skip_before_action :authenticate_user!, only: [:index, :show]
>>>>>>> blocipedia-4-crud
  def index
    @wikis = Wiki.all
  end

  def show
<<<<<<< HEAD
  end

  def new
    @wiki = Wiki.all
  end

  def edit
=======
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
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
>>>>>>> blocipedia-4-crud
  end
end