class Admin::PointsController < Admin::BaseController
  def new
    @point = Point.new
  end

  def edit
    @points = Point.find(params[:id])
  end
end
