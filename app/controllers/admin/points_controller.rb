class Admin::PointsController < Admin::BaseController
  def new
    @point = Point.new
  end
end
