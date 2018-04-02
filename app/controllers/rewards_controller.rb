class RewardsController < ApplicationController
  def create
    reward = Reward.new(reward_params)
    if reward.save
      redirect_to rewards_path
    else
      render :new
    end
  end

  def index
    @rewards = Reward.all
  end

  private

    def reward_params
      params.require(:reward).permit(:title)
    end
end
