class Api::V1::Merchants::MerchantsRevenueController < ApplicationController
  def show
    render json: Merchant.revenue_by_date(params[:date])
  end
end
