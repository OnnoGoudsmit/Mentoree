class ReviewsController < ApplicationController
  def new
    @meeting = Meeting.find(params[:meeting_id])
    @review = Review.new
    skip_authorization
  end

  def create
    @review = Review.new(review_params)
    @meeting = Meeting.find(params[:meeting_id])
    @review.meeting_id = @meeting.id
    if @review.save
    # we want to display the review in the mentor show page
      redirect_to after_sign_up_path(@review.meeting.mentor.id)
    else
      render :new
    end
    skip_authorization
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to after_sign_up_path(@review.meeting.mentor.id)

  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
