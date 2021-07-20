class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: ItemSerializer.new(items)
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

  #private
  #def _params
    #params.permit(:)
  #end
end
