class PointsController < ApplicationController
before_filter :show, :only =>[:destroy]

  def show
    @point = Point.find params[:id]  
  end
   
  def new
    @point = Point.new
    @debates = Debate.all
    @evidences = Evidence.all
    @supporting = params[:supporting] 

  end

  def create
    @point = Point.new
    @point.debate_id = params[:point][:debate_id]
    @point.evidence_id = params[:point][:evidence_id]
    @point.supporting= params[:point][:supporting]
    if @point.save
      redirect_to debate_url(params[:point][:debate_id])
    else
      @debates = Debate.all
      @evidences = Evidence.all
      @supporting = params[:point][:supporting]
      render action: :new
    end

  end

  def destroy
    @point.destroy
    redirect_to debate_url(@point.debate_id)
  end

  def vote_up
    begin
      point = Point.find(params[:id])
      current_user.vote_for(point)
      redirect_to debate_url(point.debate_id)
    rescue ActiveRecord::RecordInvalid
      redirect_to debate_url(point.debate_id)
    end
  end
end
