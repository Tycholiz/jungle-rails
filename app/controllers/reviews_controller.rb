class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create
    @review.user = current_user
    if @review.save
      redirect_to :back
    end
  end
end
