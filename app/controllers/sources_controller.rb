class SourcesController < ApplicationController
  before_filter :authenticate_user!

  def index
	  @sources = Source.all
  end

  def new
		2.times do
    @source = Source.new
		author = @source.authors.build
		end
   end

  def create
    @source = Source.create(params["source"])
    redirect_to source_path(@source) 

  end

  def show
	  @source = Source.find(params[:id])
  end
end
