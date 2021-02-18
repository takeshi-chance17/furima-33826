class Adress < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :phone_number,    presence: true
  validates :postal_code,     presence: true
  validates :prefecture_id,   presence: true
  validates :city,            presence: true
  validates :house_number,    presence: true
  validates :building_name
end
