class AfterSignUpController < ApplicationController

  def index
    # @users = User.all
    @mentors = User.mentors.last(3)
    @mentor =  User.mentors.first
    #@work_experience = JSON.parse(@mentor.user_industry.work_experience)
    # @user.where(user.availability )
    skip_policy_scope
  end

  def show
    # current user is the mentoree booking with a mentor
    @mentoree = current_user
    # Mentor is the one who'se profile you are checking
    @mentor = User.find(params[:id])
    # # Checking slots of mentor
    @slots = @mentor.get_slots
    #Mentoree already has upcoming meeting
    @upcoming_meeting = current_user.upcoming_meetings&.first
    # # raise
    @meeting = Meeting.new(mentoree_id: @mentoree)
    @work_experience = JSON.parse(@mentor.user_industry.work_experience)
    skip_authorization
  end

  def new
    skip_authorization
  end

  def update
    skip_authorization
    if current_user.update(user_params)
      redirect_to new_after_sign_up_user_industry_path(current_user)
    else
      render :new
    end

    # change later redirecto_to dashboard.
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :phone_number, :city, :about, :photo)
  end
end



# User can see all mentors (index)
