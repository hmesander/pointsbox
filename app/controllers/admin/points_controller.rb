class Admin::PointsController < Admin::BaseController
  def new
    @point = Point.new
  end

  def create
    @user = User.find(params[:user_id])
    @point = @user.points.create!
    @user.update_points
    redirect_to admin_user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    if @user.points.count >= 1
      @point = @user.points.last.destroy
    end
    redirect_to admin_user_path(@user)
  end
end
