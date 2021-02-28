require 'rails_helper'

RSpec.describe BuyerItem, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer)
  end
  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての情報が正常に入力されている' do
        expect(@buyer).to be_valid
      end
      it 'building_nameが空の時' do
        @buyer.building_name = nil
        expect(@buyer).to be_valid
      end
    end
    context '購入できない時' do
      # phone_number
      it 'phone_numberが空では購入できない' do
        @buyer.phone_number = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが半角数字以外では購入できない' do
        @buyer.phone_number = '００００００００００'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include 'Phone number Half-width number'
      end
      # postal_code
      it 'postal_codeが空では購入できない' do
        @buyer.postal_code = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeが半角数字以外では購入できない' do
        @buyer.postal_code = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include 'Postal code Half-width number'
      end
      # prefecture_id
      it 'prefecture_idが空では購入できない' do
        @buyer.prefecture_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include 'Prefecture Select'
      end
      # city
      it 'cityが空では購入できない' do
        @buyer.city = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "City can't be blank"
      end
      it 'cityが空では日本語意外では購入できない' do
        @buyer.city = 'aaa'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include 'City is invalid. Input full-width characters.'
      end
      # house_number
      it 'house_numberが空では購入できない' do
        @buyer.house_number = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "House number can't be blank"
      end
      # token
      it 'tokenが空では購入できない' do
        @buyer.token = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
