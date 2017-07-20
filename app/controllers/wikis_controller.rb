class WikisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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
