class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
  end

  def new
    @wiki = Wiki.all
  end

  def edit
  end
end
