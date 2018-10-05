class Api::V1::Merchants::MerchantRandomController < ApplicationController
  def show
    render json: Merchant.all.sample(1)
  end
end
