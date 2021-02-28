class BuyersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :sign_in_confirmation, only: [:index, :create]
  before_action :user_confirmation, only: [:index, :create]

  def index
    @buyer_item = BuyerItem.new
    sale_confirmation
  end

  def create
    @buyer_item = BuyerItem.new(buyer_params)
    if @buyer_item.valid?
      payjp_proc
      @buyer_item.save(current_user.id, @item.id)
      redirect_to root_path
    else
      render :index, model: @buyer_item
    end
  end

  private

  def buyer_params
    params.require(:buyer_item).permit(:phone_number, :postal_code,
                                       :prefecture_id, :city, :house_number,
                                       :building_name).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def sale_confirmation
    h = BuyHistory.all
    h.length.times do |i|
      if @item.id == h[i].item_id
        redirect_to root_path
      end
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sign_in_confirmation
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def user_confirmation
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def payjp_proc
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end
