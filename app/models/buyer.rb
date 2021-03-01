class Buyer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buy_history
end
