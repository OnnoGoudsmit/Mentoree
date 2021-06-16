class DashboardController < ApplicationController
  def my_dashboard
    @user = current_user
    @meeting = current_user.upcoming_meetings&.first
    authorize :dashboard
  end
end
