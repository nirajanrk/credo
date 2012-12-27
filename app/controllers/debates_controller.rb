class DebatesController < ApplicationController
  def index
    @debates = Debate.all
  end

  def new
    @debate = Debate.new
  end

  def show
    @debate = Debate.find params[:id]

	
  end

  def create
    @debate = Debate.new params[:debate]
    if @debate.save
      redirect_to debate_url(@debate)
    else
      render action: :edit
    end
  end

  def edit
    @debate = Debate.find params[:id]
  end

  def update
    @debate = Debate.find params[:id]
    @debate.attributes = params[:debate]
    if @debate.save
      redirect_to debate_url(@debate)
    else
      render action: :edit
    end
  end

  def destroy
    @debate = Debate.find params[:id]
    @debate.destroy
    redirect_to debates_url
  end
end
