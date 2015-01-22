class ReviewsController < ApplicationController

  def new
    @participation = Participation.find(params[:participation_id])
    @review = Review.new
  end

  def create
    @participation = Participation.find(params[:participation_id])
    @review = @participation.reviews.create review_params
    if @review.save
      flash[:success] = "Review has been created!"
      redirect_to trip_path(id: @participation.trip.id)
    else
      @errors = @review.errors.full_messages
      flash[:error] = @errors.first
      redirect_to action: 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:author_id, :content, :score)
  end
end
