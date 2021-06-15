class DashboardController < ApplicationController
  def my_dashboard
    @user = current_user
    authorize :dashboard
  end
end
