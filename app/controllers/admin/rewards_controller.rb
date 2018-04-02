class Admin::RewardsController < ApplicationController
  before_action :require_admin

  def index
  end

  private

    def require_admin
      render file: '/public/404' unless current_user.admin?
    end
end