class ItemsController < ApplicationController
    def index
        @items = Item.order("created_at DESC")
    end

    def create
    end

    def new
    end

    def edit
    end

    def show
    end

    def update
    end

    def destroy
    end

    private
    def user_params
    end
end
