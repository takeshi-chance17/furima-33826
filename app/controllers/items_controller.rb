class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_buyhistry, only: [:index, :show, :edit]
  before_action :move_index, only: [:edit, :update, :destroy]
  before_action :selling_confirmation, only: [:edit]

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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, model: @item
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
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

  def set_buyhistry
    @buyhistry = BuyHistory.all
  end

  def move_index
    redirect_to root_path unless @item.user.id == current_user.id
  end

  def selling_confirmation
    @buyhistry.length.times do |h|
      if @item.id == @buyhistry[h].item_id
        redirect_to root_path
      end
    end
  end
end
