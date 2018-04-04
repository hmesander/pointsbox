class UserRewardsController < ApplicationController
  def create
    user_reward = UserReward.new(user_id: params[:user_id], reward_id: params[:reward_id])
    reward_value = Reward.find(params[:reward_id]).value

    if current_user.available_points >= reward_value
      user_reward.save
      current_user.convert_points(reward_value)
      flash[:notice] = "You have redeemed this reward!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Sorry, you don't have enough available points!"
      redirect_to rewards_path
    end
  end
end
