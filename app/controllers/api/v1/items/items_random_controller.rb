class Api::V1::Items::ItemsRandomController < ApplicationController
  def show
    render json: Item.all.sample(1)
  end
end
