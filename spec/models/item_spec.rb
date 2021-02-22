require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '出品できるとき' do
      it '全ての情報が正常に入力されている' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it 'priceが300より小さい値では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが9999999より大きい値では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = '100abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'priceが半角英字だけでは登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it 'status_idが空では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status Select'
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition Select'
      end
      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery fee Select'
      end
      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture Select'
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
