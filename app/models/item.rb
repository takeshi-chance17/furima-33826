class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :prefecture
    belongs_to :delivary_fee
    belongs_to :status

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :categoty_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1}
end
