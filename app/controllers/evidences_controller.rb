class EvidencesController < ApplicationController
  before_filter :show, :only => [:edit, :update, :destroy]
  
  def show
       @evidence = Evidence.find params[:id]
  end
  
  def new
    @evidence = Evidence.new
    @sources = Source.all
  end

  def create
    @evidence = Evidence.new params[:evidence]
    if @evidence.save
      redirect_to evidence_url(@evidence)
    else
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
