class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :set_item, only: [:show, :edit]
  before_action :move_index, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, model: @item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id,
                                 :condition_id, :prefecture_id, :delivery_fee_id,
                                 :status_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_index
    @login_user = Item.find(params[:id])
    unless user_signed_in? then
      redirect_to new_user_session_path
    else
      unless @login_user.user.id == current_user.id then
        redirect_to root_path
      end
    end
  end
end
