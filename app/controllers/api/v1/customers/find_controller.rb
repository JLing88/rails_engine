class Api::V1::Customers::FindController < ApplicationController
  def show
    render json: Customer.find_by(customer_params)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :updated_at, :created_at)
  end
end
