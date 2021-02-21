class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @items = Item.all.order(created_at: :asc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, model: @item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id,
                                 :condition_id, :prefecture_id, :delivery_fee_id,
                                 :status_id).merge(user_id: current_user.id)
  end
end
