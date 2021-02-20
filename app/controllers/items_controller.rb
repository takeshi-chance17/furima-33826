class ItemsController < ApplicationController
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
        params.require(:item).permit(:name, :description, :delivary_fee_id, :price,
                                     :image, :category_id, :condition_id, :prefecture_id,
                                     :delivery_fee_id, :status_id).merge(user_id: current_user.id)
    end
end
