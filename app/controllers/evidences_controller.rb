class EvidencesController < ApplicationController
  def destroy
    @evidence = Evidence.find params[:id]
    @evidence.destroy
    redirect_to evidences_url
  end

  def index
    @evidences = Evidence.all
  end

  def show
    @evidence = Evidence.find params[:id]
  end

  def edit
    @evidence = Evidence.find params[:id]
  end

  def update
    @evidence = Evidence.find params[:id]
    @evidence.attributes = params[:evidence]
    if @evidence.save
      redirect_to evidence_url(@evidence)
    else
      render action: :edit
    end
  end
end
