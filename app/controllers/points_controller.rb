class PointsController < ApplicationController
  def new
    @point = Point.new
  end

  def create
    @point = Point.new params[:point]
    if @point.save
      redirect_to point_url(@point)
    else
      render action: :edit
    end
  end

  def edit
    @point = Point.find params[:id]
  end

  def update
    @point = Point.find params[:id]
    @point.attributes = params[:point]
    if @point.save
      redirect_to point_url(@point)
    else
      render action: :edit
    end
  end

  def destroy
    @point = Point.find params[:id]
    @point.destroy
    redirect_to points_url
  end

  def index
    @points = Point.all
  end

  def show
    @point = Point.find params[:id]
  end
end
