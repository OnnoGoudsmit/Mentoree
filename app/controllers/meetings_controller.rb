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

  def edit
    @meeting = Meeting.find(params[:id])
    authorize @meeting
    @subjects = current_user.get_advice_preference
  end

  def update
    @meeting = Meeting.find(params[:id])
    authorize @meeting
    if @meeting.update(meeting_params)
      redirect_to my_dashboard_path
    else
      render :edit
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:availability_id, :prep_content)
  end
end
