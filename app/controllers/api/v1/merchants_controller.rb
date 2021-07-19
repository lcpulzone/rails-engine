class Api::V1::MerchantsController < ApplicationController
  PER_PAGE = 20

  def index
    @page = params.fetch(:page, 1).to_i
    per_page = 20
    render json: MerchantSerializer.new(Merchant.offset((@page - 1) * PER_PAGE).limit(PER_PAGE))
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
