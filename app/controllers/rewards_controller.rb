class RewardsController < ApplicationController
  def create
    reward = Reward.new(reward_params)
    if reward.save
      flash.notice = "#{reward.title} was created!"
      redirect_to admin_rewards_path
    else
      flash.notice = 'Missing required information!'
      redirect_to new_admin_reward_path
    end
  end

  def index
    @rewards = Reward.all
    @user = User.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    @reward.update(reward_params)
    flash.notice = "#{@reward.title} was updated!"
    redirect_to admin_rewards_path
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    flash[:success] = "#{@reward.title} was deleted."
    redirect_to admin_rewards_path
  end

  private
    def reward_params
      params.require(:reward).permit(:title, :description, :image, :value)
    end
end
