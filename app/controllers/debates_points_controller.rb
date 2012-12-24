class DebatesPointsController < ApplicationController
  def new
    @debates_point = DebatesPoint.new
    @debates = Debate.all
    @points = Point.all
    @supporting = params[:supporting]
  end

  def create
    @debates_point = DebatesPoint.new
    @debates_point.debate_id = params[:debates_point][:debate_id]
    @debates_point.point_id = params[:debates_point][:point_id]
    @debates_point.supporting= params[:debates_point][:supporting]
    if @debates_point.save
      redirect_to debate_url(params[:debates_point][:debate_id])
    else
      @debates = Debate.all
      @points = Point.all
      @supporting = params[:debates_point][:supporting]
      render action: :new
    end
  end

  def destroy
    @debates_point = DebatesPoint.find params[:id]
    @debates_point.destroy
    redirect_to debate_url(@debates_point.debate_id)
  end

  def vote_up
    begin
      debates_point = DebatesPoint.find(params[:id])
      current_user.vote_for(debates_point)
      redirect_to debate_url(debates_point.debate_id)
    rescue ActiveRecord::RecordInvalid
      redirect_to debate_url(debates_point.debate_id)
    end
  end
end
