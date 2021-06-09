class UsersController < ApplicationController
  def edit


  end

  private

  def user_params
    params.require(:user).permit(:title, :body, :photo)
  end
end

