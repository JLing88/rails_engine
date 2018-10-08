class Api::V1::Merchants::SingleRevenueController < ApplicationController
  def show
    render json: Merchant.revenue(params[:merchant_id]),
      serializer: RevenueSerializer
  end
end
