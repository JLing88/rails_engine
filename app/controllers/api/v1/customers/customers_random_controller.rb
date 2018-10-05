class Api::V1::Customers::CustomersRandomController < ApplicationController
  def show
    render json: Customer.all.sample(1)
  end
end
