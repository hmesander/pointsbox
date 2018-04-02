class Admin::RewardsController < Admin::BaseController

  def index
  end

  def new
    @reward = Reward.new
  end

end
