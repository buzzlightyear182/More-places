class ReviewsController < ApplicationController

  def new
    @participation = Participation.find(params[:participation_id])
    @review = Review.new
  end

  def create
  end
end
