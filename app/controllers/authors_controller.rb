class AuthorsController < ApplicationController
  before_filter :authenticate_source!

  def index
	@authors = Author.all
  end

  def show
	@author = Author.find(params[:id])
  end
  
  author1 = Author.create(:firstname => "Nirajan", :lastname => "Rajkarnikar")
  
end
