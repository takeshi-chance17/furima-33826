class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :delivery_fee
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  validates :price, numericality: { message: 'Half-width number' }
  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'

  with_options presence: true do
    validates :name, :description, :image, :price
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :delivery_fee_id
    validates :status_id
  end
end
