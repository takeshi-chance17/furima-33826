class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :prefecture
    belongs_to :delivery_fee
    belongs_to :status
    has_one_attached :image

    with_options presence: true do
        validates :name, :description, :image
        validates :price, inclusion: { in: 300..9999999, message: "Out of setting range" }, format: { with: /\A[0-9]+\z/, message: "Half-width number" }
    end

    #ジャンルの選択が「--」の時は保存できないようにする
    with_options numericality: { other_than: 1, message: "Select" } do
        validates :category_id
        validates :condition_id
        validates :prefecture_id
        validates :delivery_fee_id
        validates :status_id
    end
end
