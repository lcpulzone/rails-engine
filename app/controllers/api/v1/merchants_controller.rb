class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
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