class BuyersController < ApplicationController
    def index
        @item = Item.find_by(params['item_id'])
    end

    def create
        @buyer = Buyer.new(buyer_params)
        if @buyer.valid?
            @buyer.save
            return redirect_to root_path
        else
            render :index
        end
    end

    def new
        @item = Item.find_by(id: params[:format])
    end

    private
    def buyer_params
        params.require(:buyer).permit(:phone_number, :postal_code, 
                                      :prefecture_id, :city, :house_number,
                                      :building_name).merge(:buy_history)
    end
end
