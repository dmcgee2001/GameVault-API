class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    render :index
  end

  def show
    @review = Review.find_by(id params[:id])
    render :show
  end

  def create
    @review = Review.new(
      user_id: current_user.id,
      title: params[:title],
      text: params[:text],
    )
    if @review.save
      render :show
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @review = Review.find_by(id params[:id])
    @review.update!(
      user: current_user,
      title: params[:title] || @review.title,
      text: pararms[:text] || @review.text,
    )
    if @review.valid?
      render :show
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    review = Review.find_by(id params[:id])
    review&.destroy
    render json: { message: "Review has been successfully deleted." }
  end
end
