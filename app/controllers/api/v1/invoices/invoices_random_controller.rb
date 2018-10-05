class Api::V1::Invoices::InvoicesRandomController < ApplicationController
  def show
    render json: Invoice.all.sample(1)
  end
end
