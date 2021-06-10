class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    # 1. get user info
    @user = current_user
    authorize @user
    # 2. reach user params (user_params)
    # 3. combi update user with params
    @user.update(user_params)

    # 4. save it
    @user.save
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :about, :email, :password, :age, :phone_number)
  end
end

# STORY SIGN UP
# 1- TODO: edit validations User model only first_name and last_name in presence: true. CHECK

# 2- Sign up with first name and last name redirect to dashboard card with welcome message.

# 3- When in dashboard redirect to form to edit+update user model with remaining info.

# 4- When info form completed redirect to advice-preference model NEW form.

# 5- When both forms completed redirect to dashboard with new message and button: FIND MENTOR

# work in silo:
# route users only edit and update
# generate controller edit and update action

# DONE:
# In application controller allow params of devise for edit registration with new params. (Editing happening after sign up in profile forms).


