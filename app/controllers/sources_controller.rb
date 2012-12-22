class SourcesController < ApplicationController
  def index
    @sources = Source.all
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(params["source"])
    if @source.save
      redirect_to source_path(@source)
    else
      render action: 'new'
    end
  end

  def show
    @source = Source.find(params[:id])
  end
end
