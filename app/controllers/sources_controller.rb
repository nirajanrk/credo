class SourcesController < ApplicationController
  before_filter :authenticate_source!

  def index
	@sources = Source.all
  end

  def show
	@source = Source.find(params[:id])
  end
  
  source1 = Source.new(5, "This is Fake", "The Journal of Excellent Fakery", "Fake stuff makes Fake stuff", "study", "www.credo.com", "1988")
  source1.save!
end
