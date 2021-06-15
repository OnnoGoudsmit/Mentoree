class DashboardController < ApplicationController
  def my_dashboard
    @user = current_user
    authorize :dashboard
  end

  private

  def meeting_params
    params.require(:meeting).permit(:availability_id)
  end
end
