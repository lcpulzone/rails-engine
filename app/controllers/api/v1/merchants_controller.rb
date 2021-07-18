class Api::V1::MerchantsController < ApplicationController

  def index
    @page = params.fetch(:page, 0).to_i
    per_page = 20
    render json: MerchantSerializer.new(Merchant.offset(@page * per_page).limit(per_page))
  end

  # def show
  #
  # end
  #
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
