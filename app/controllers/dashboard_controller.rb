class DashboardController < ApplicationController
  def my_dashboard
    @user = current_user
    @meeting = current_user.upcoming_meetings&.first
    @previous_meeting = current_user.previous_meetings&.last
    authorize :dashboard
  end
end
