class AfterSignUpController < ApplicationController

  def index
    # @users = User.all
    @mentors = User.mentors.first(3)
    @mentor =  User.mentors.first
    # @user.where(user.availability )
    skip_policy_scope
  end

  def show
    @user = User.new

    skip_authorization
  end

  def new
    skip_authorization
  end

  def update
    skip_authorization
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :new
    end

    # change later redirecto_to dashboard.
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :phone_number, :city, :about)
  end
end



# User can see all mentors (index)
