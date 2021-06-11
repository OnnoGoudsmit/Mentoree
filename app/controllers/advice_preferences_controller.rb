class AdvicePreferencesController < ApplicationController

  def new
    @user = current_user
    @advice_preference = Advice_preferences.new

    # @restaurant = Restaurant.find(params[:restaurant_id])
    # @review = Review.new
  end

end

