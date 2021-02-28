class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @buyer_item = BuyerItem.new
    @item = Item.find(params[:format])
  end

  def create
    @item = Item.find(params[:format])
    @buyer_item = BuyerItem.new(buyer_params)
    if @buyer_item.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
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
                                       :building_name).merge(token: params[:token])
  end
end
