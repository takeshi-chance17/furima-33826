class BuyerItem < ApplicationController
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token, :phone_number, :postal_code, :prefecture_id, :city, :house_number, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :phone_number,    numericality: { message: 'Half-width number' }, length: { in: 10..11, message: 'Out of setting range' }
    validates :postal_code,     format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city,            format: { with: /\A[ぁ-んァ-ヶ一-龥々]/, message: 'is invalid. Input full-width characters.' }
    validates :house_number
    validates :token
    validates :user_id
    validates :item_id
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
  end

  def save(user_id, item_id)
    buyhistry = BuyHistory.create(user_id: user_id, item_id: item_id)
    Buyer.create(phone_number: phone_number, postal_code: postal_code, prefecture_id: prefecture_id,
                 city: city, house_number: house_number, building_name: building_name, buy_history_id: buyhistry.id)
  end
end
