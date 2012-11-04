class SourcesController < ApplicationController
  before_filter :authenticate_user!

  def index
	  @sources = Source.all
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.create(params["source"])
    redirect_to sources_path
  end

  def show
	  @source = Source.find(params[:id])
  end
end
