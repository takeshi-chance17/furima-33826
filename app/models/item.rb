class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :prefecture
    belongs_to :delivery_fee
    belongs_to :status
    has_one_attached :image

    with_options presence: true do
        validates :name
        validates :description
        validates :price
    end

    #ジャンルの選択が「--」の時は保存できないようにする
    with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :condition_id
        validates :prefecture_id
        validates :delivery_fee_id
        validates :status_id
    end
end
