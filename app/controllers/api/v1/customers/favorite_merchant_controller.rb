class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    render json: Customer.favorite_merchant(params[:customer_id])
  end
end
