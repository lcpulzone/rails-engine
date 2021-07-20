class Api::V1::MerchantsController < ApplicationController
  def index
    page = params.fetch(:page, 1).to_i
    per_page = 20
    render json: MerchantSerializer.new(Merchant.offset((page - 1) * per_page).limit(per_page))
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  # def new
  #
  # end
  #
  # def create
  #
  # end
  #
  # def edit
  #
  # end
  #
  # def update
  #
  # end
  #
  # def destroy
  #
  # end

  # private
  # def _params
  #   params.permit(:)
  # end
end
