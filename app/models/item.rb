class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to  :category

    has_many    :user_items,    dependent: :destroy
    has_many    :users,         through: :user_items
    belongs_to  :address

    validates :name,            presence: true
    validates :description,     presence: true
    validates :candition,       presence: true
    validates :price,           presence: true
    validates :status,          presence: true
    validates :delivery_fee,    presence: true
    validates :category_id,     numericality: { other_than: 1 }
end