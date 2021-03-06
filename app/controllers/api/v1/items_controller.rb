class Api::V1::ItemsController < ApplicationController
  def index
    per_page = params.fetch(:per_page, 20).to_i
    page = params.fetch(:page, 1).to_i
    page = 1 if page < 1
    render json: ItemSerializer.new(Item.offset((page - 1) * per_page).limit(per_page))
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    item = merchant.items.create(item_params)
    render json: ItemSerializer.new(item), status: :created
    # render json: ItemSerializer.new(item), status: 201 -Both lines 16 & 17 are the same thing
  end

  def update
    begin
      item = Item.find(params[:id])
      if item.update(item_params)
        render json: ItemSerializer.new(item)
      else
        render status: :not_found
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found
    end
  end

  def destroy
    Item.destroy(params[:id])
  end

  private
  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
