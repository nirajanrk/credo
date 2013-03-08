class EvidencesController < ApplicationController
  before_filter :initialize_data, :only => [:edit, :update, :destroy]

  def initialize_data
    @evidence = Evidence.find params[:id]
  end

  def show
    @evidence = Evidence.find params[:id]
  end

  def new
    @evidence = Evidence.new
    @sources = Source.all
    @debates = Debate.all
    @evidence.points.build
    @debate = Debate.find params[:debate_id]
    if params[:supporting] == "true"
      @supporting = true
    else
      @supporting = false
    end
  end

  def create
    @debate = Debate.find params[:debate_id]
    @evidence = Evidence.new params[:evidence]

    if @evidence.save
      redirect_to debate_url(@debate)
    else
      @debates = Debate.all
      @sources = Source.all
      render action: :edit
    end
  end

  def edit
    @sources = Source.all
  end

  def update
    @evidence.attributes = params[:evidence]
    if @evidence.save
      redirect_to evidence_url(@evidence)
    else
      @sources = Source.all
      render action: :edit
    end
  end

  def destroy
    @evidence.destroy
    redirect_to evidences_url
  end

  def index
    @evidences = Evidence.all
  end
end
