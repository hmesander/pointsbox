class Admin::PointsController < Admin::BaseController
  def new
    @point = Point.new
  end

  def create
    @user = User.find(params[:user_id])
    Point.create!(user_id: @user.id, status: 0)
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
