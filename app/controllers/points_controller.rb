class PointsController < ApplicationController
  def show
    @point = Point.find params[:id]
  end

  def new
    @debate = Debate.find params[:debate_id]
    @point = Point.new(debate_id: @debate.id)
    @sources = Source.all
    if params[:supporting] == "true"
      @supporting = true
    elsif params[:supporting] == "false"
      @supporting = false
    end
  end

  def create
    debate_id = params[:debate_id]
    @point = Point.new(params[:point].merge(debate_id: debate_id))
    if @point.save
      redirect_to debate_url(debate_id)
    else
      @debate = Debate.find debate_id
      @sources = Source.all
      @supporting = params[:point][:supporting]
      render action: :new
    end
  end

  def destroy
    @point = Point.find params[:id]
    @point.destroy
    redirect_to debate_url(@point.debate_id)
  end

  def vote_up
    begin
      point = Point.find(params[:point_id])
      current_user.vote_for(point)
      redirect_to debate_url(point.debate_id)
    rescue ActiveRecord::RecordInvalid
      redirect_to debate_url(point.debate_id)
    end
  end
end
