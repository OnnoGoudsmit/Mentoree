class UserIndustriesController < ApplicationController
  def new
    skip_authorization # <-------- UPDATE CORRECTLY!
    @user = current_user
    @user_industry = UserIndustry.new
  end

  def create
    skip_authorization # <-------- UPDATE CORRECTLY!
    @user_industry = UserIndustry.new(user_industry_params)
    @user = current_user
    @user_industry.user = @user
    if @user_industry.save
      redirect_to new_after_sign_up_advice_preference_path(current_user)
    else
      render :new
    end

  end

  private

  def user_industry_params
    params.require(:user_industry).permit(:work_experience, :industry_id)
  end
end
