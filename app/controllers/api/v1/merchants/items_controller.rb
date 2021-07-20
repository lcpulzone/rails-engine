class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    merchant = Merchant.find(params[:merchant_id])
    merchantitems = merchant.items
    render json: ItemSerializer.new(merchantitems)
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  #private
  #def _params
    #params.permit(:)
  #end
end
