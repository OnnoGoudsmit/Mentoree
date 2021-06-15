class MeetingsController < ApplicationController
  def index
    @meetings = policy_scope(Meeting)
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.mentoree_id = current_user.id
    authorize @meeting
    if @meeting.save
      redirect_to my_dashboard_path
    else
      render :new
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:availability_id)
  end
end
