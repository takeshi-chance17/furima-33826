class ItemsController < ApplicationController
  before_action :move_to_index, only: [:create, :new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

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

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
