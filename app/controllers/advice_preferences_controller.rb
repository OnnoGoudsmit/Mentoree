class AdvicePreferencesController < ApplicationController

  def new
    skip_authorization
    @user = current_user
    @advice_preference = AdvicePreference.new
  end

end

