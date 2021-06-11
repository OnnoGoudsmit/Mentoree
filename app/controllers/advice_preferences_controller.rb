class AdvicePreferencesController < ApplicationController

  def new
    skip_authorization # <-------- UPDATE CORRECTLY!
    @user = current_user
    @advice_preference = AdvicePreference.new
  end

  def create
    skip_authorization # <-------- UPDATE CORRECTLY!
    @advice_preference = AdvicePreference.new(advice_preference_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @user = current_user
    @advice_preference.user = @user

    if @advice_preference.save
      redirect_to my_dashboard_path(current_user)
    else
      render :new
    end

  end

  private

  def advice_preference_params
    params.require(:advice_preference).permit(:subject, :industry_id)
  end

end

