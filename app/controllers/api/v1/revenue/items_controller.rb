class Api::V1::Revenue::ItemsController < ApplicationController
  def index
    if items = Item.items_by_revenue(params[:quantity])
      render json: ItemSerializer.new(items)
    else
      render status: :not_found
    end
  end
end
