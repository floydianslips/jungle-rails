class RatingsController < ApplicationController

  def create
    @user ||= User.find(session[:user_id]).first_name if session[:user_id]
    @rating = Rating.new(rating_params)
    @rating.user_id = session[:user_id]
    @rating.product_id = params[:product_id]
    if @rating.save
      redirect_to [:root], notice: 'Review created!'
    else
      redirect_to '/products/1'
    end
  end 

  private

  def rating_params
    params.require(:rating).permit(
      :rating,
      :description,
      :user_id,
      :product_id
    )  
  end

end
