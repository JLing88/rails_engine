class Api::V1::Transactions::TransactionsRandomController < ApplicationController
  def show
    render json: Transaction.all.sample(1)
  end
end
