class Api::V1::MerchantsController < ApplicationController
  def index
    per_page = params.fetch(:per_page, 20).to_i
    page = params.fetch(:page, 1).to_i
    page = 1 if page < 1
    render json: MerchantSerializer.new(Merchant.offset((page - 1) * per_page).limit(per_page))
    # render json: MerchantSerializer.new(Merchant.page_limit(page, page_limit))
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
