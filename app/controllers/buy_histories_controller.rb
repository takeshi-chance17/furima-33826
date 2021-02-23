class BuyHistoriesController < ApplicationController
    def create
        buyer = Buyer.create(buyer_params)
    end

    private
    def buyer_params
        params.require(:buy_history).permit(:phone_number, :postal_code, :prefecture_id,
                                            :city, :house_name, :building_name).merge(:buy_history)
    end
end
